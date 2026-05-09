; DESCRIPTION: Draws a black rectangle at (193, 125) with width 104 and height 118.
; PLAN: r0=193(x), r1=125(y), r2=104(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 125
LDI r2, 104
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
