; DESCRIPTION: Draws a black rectangle at (107, 33) with width 46 and height 107.
; PLAN: r0=107(x), r1=33(y), r2=46(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 33
LDI r2, 46
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
