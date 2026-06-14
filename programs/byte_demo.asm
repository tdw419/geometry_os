; byte_demo.asm -- Phase 282: Typed Memory Access Demo
; Demonstrates LOADB/STOREB/LOADH/STOREH
;
; Draws a 4-pixel color bar at row 50 using packed data:
;   (100,50) = red    from STOREB + LOADB roundtrip
;   (101,50) = green  from STOREH + LOADH roundtrip
;   (102,50) = blue   from STOREB preserving upper bits
;   (103,50) = yellow from STOREH preserving upper bits

; --- Demo 1: STOREB/LOADB roundtrip ---
; Store 0xFF into low byte of word at 0x2000
LDI r10, 0x2000
LDI r1, 0xFF
STOREB r10, r1
; Read it back
LOADB r2, r10
; r2 = 0xFF = blue channel only
; Pack into red: shift left 16
LDI r3, 16
SHL r2, r3
; r2 = 0x00FF0000 (pure red)
LDI r11, 100
LDI r12, 50
PSET r11, r12, r2

; --- Demo 2: STOREH/LOADH roundtrip ---
; Store 0xFF00 into low halfword of word at 0x2001
LDI r10, 0x2001
LDI r1, 0xFF00
STOREH r10, r1
; Read it back
LOADH r2, r10
; r2 = 0xFF00 = green in bits 15:8
LDI r11, 101
PSET r11, r12, r2

; --- Demo 3: STOREH preserves upper 16 bits ---
; First write 0x00FF0000 (red) to 0x2002 via regular STORE
LDI r10, 0x2002
LDI r1, 0x00FF0000
STORE r10, r1
; Now STOREH 0x00FF into low halfword -> result = 0x00FF00FF
LDI r1, 0x00FF
STOREH r10, r1
; Read back the full word
LOAD r2, r10
; r2 = 0x00FF00FF (red+blue = magenta-ish)
LDI r11, 102
PSET r11, r12, r2

; --- Demo 4: STOREB preserves upper 24 bits ---
; First write 0x00FFFF00 (yellow) to 0x2003
LDI r10, 0x2003
LDI r1, 0x00FFFF00
STORE r10, r1
; Now STOREB 0x00 into low byte -> result = 0x00FFFF00 (unchanged)
LDI r1, 0x00
STOREB r10, r1
LOAD r2, r10
; r2 = 0x00FFFF00 (yellow, unchanged since we stored 0)
LDI r11, 103
PSET r11, r12, r2

HALT
