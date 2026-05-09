; DESCRIPTION: Draws a black rectangle at (186, 80) with width 75 and height 117.
; PLAN: r0=186(x), r1=80(y), r2=75(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 80
LDI r2, 75
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
