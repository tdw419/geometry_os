; driver_abi.asm -- Geometry OS Driver ABI Definitions
;
; Memory Layout for Driver Registration:
;   RAM[0x7000]: driver_count (u32)
;   RAM[0x7004]: driver_table entries (16 bytes each)
;
; Entry Format:
;   [0] Type (1=Screen, 2=Input, 3=Disk, 4=Timer, 5=Audio)
;   [4] Init Entry Point (u32)
;   [8] Handler Entry Point (u32)
;   [12] Private Data Pointer (u32)

.macro REGISTER_DRIVER type, init_addr, handler_addr, private_ptr
    ; Get current count
    LDI r29, 0x7000
    LOAD r28, r29
    
    ; Calculate offset: 0x7004 + (count * 16)
    MOV r27, r28
    LDI r26, 16
    MUL r27, r27, r26    ; r27 = count * 16
    LDI r26, 0x7004
    ADD r27, r27, r26    ; r27 = table_entry_addr
    
    ; Write Type
    LDI r26, type
    STORE r27, r26
    
    ; Write Init
    ADDI r27, r27, 4
    LDI r26, init_addr
    STORE r27, r26
    
    ; Write Handler
    ADDI r27, r27, 4
    LDI r26, handler_addr
    STORE r27, r26
    
    ; Write Private Data
    ADDI r27, r27, 4
    LDI r26, private_ptr
    STORE r27, r26
    
    ; Increment count
    ADDI r28, r28, 1
    STORE r29, r28
.endm
