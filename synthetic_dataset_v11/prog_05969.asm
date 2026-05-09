; DESCRIPTION: Draws a black rectangle at (75, 99) with width 104 and height 93.
; PLAN: r0=75(x), r1=99(y), r2=104(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 99
LDI r2, 104
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
