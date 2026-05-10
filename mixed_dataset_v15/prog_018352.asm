; DESCRIPTION: Draws a cyan rectangle at (253, 162) with width 75 and height 46.
; PLAN: r0=253(x), r1=162(y), r2=75(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 162
LDI r2, 75
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
