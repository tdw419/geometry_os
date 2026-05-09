; DESCRIPTION: Draws a cyan rectangle at (129, 106) with width 12 and height 79.
; PLAN: r0=129(x), r1=106(y), r2=12(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 106
LDI r2, 12
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
