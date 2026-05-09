; DESCRIPTION: Draws a green rectangle at (368, 186) with width 96 and height 15.
; PLAN: r0=368(x), r1=186(y), r2=96(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 186
LDI r2, 96
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
