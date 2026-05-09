; DESCRIPTION: Draws a black rectangle at (45, 100) with width 109 and height 44.
; PLAN: r0=45(x), r1=100(y), r2=109(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 100
LDI r2, 109
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
