; DESCRIPTION: Draws a yellow rectangle at (164, 111) with width 110 and height 107.
; PLAN: r0=164(x), r1=111(y), r2=110(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 111
LDI r2, 110
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
