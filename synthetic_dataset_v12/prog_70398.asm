; DESCRIPTION: Draws a black rectangle at (366, 2) with width 90 and height 107.
; PLAN: r0=366(x), r1=2(y), r2=90(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 2
LDI r2, 90
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
