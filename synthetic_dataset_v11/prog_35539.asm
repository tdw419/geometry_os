; DESCRIPTION: Draws a black rectangle at (63, 137) with width 16 and height 25.
; PLAN: r0=63(x), r1=137(y), r2=16(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 137
LDI r2, 16
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
