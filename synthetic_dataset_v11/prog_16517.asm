; DESCRIPTION: Draws a yellow rectangle at (223, 0) with width 32 and height 15.
; PLAN: r0=223(x), r1=0(y), r2=32(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 0
LDI r2, 32
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
