; DESCRIPTION: Draws a black rectangle at (279, 16) with width 70 and height 87.
; PLAN: r0=279(x), r1=16(y), r2=70(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 16
LDI r2, 70
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
