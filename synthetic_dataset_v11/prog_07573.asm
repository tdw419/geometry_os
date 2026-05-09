; DESCRIPTION: Draws a black rectangle at (123, 25) with width 44 and height 52.
; PLAN: r0=123(x), r1=25(y), r2=44(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 25
LDI r2, 44
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
