; DESCRIPTION: Renders a cyan box of size 57x44 starting at (279, 198).
; PLAN: r0=279(x), r1=198(y), r2=57(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 198
LDI r2, 57
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
