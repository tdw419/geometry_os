; active_logic.asm -- Spatial Computing Demo
; Demonstrates injecting signals into the Active Substrate 
; and interacting with logic gates.

:main
    ; 1. Set up XOR gate at (128, 128)
    LDI r1, 128
    LDI r2, 128
    LDI r29, 0xE000
    STORE r29, r1      ; Set Substrate X
    LDI r29, 0xE001
    STORE r29, r2      ; Set Substrate Y
    
    ; Pixel value: (TAX_LOGIC << 28) | (TYPE_XOR << 20) | RED
    ; (0x1 << 28) | (0x0 << 20) | 0xFF0000 = 0x10FF0000
    LDI r3, 0x10FF0000
    LDI r29, 0xE002
    STORE r29, r3      ; Inject XOR gate
    
    ; 2. Inject Signal moving RIGHT towards the gate
    LDI r1, 110        ; X
    LDI r2, 128        ; Y
    LDI r29, 0xE000
    STORE r29, r1
    LDI r29, 0xE001
    STORE r29, r2
    
    ; Signal value: (TAX_SIGNAL << 28) | (DIR_RIGHT << 24) | CYAN
    ; (0xC << 28) | (0x0 << 24) | 0x00FFFF = 0xC000FFFF
    LDI r3, 0xC000FFFF
    LDI r29, 0xE002
    STORE r29, r3      ; Inject Signal 1
    
:loop
    FRAME
    JMP :loop
