; DESCRIPTION: Draws a black rectangle at (198, 132) with width 106 and height 104.
; PLAN: r0=198(x), r1=132(y), r2=106(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 132
LDI r2, 106
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
