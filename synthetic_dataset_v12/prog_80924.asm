; DESCRIPTION: Draws a cyan rectangle at (183, 90) with width 106 and height 47.
; PLAN: r0=183(x), r1=90(y), r2=106(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 90
LDI r2, 106
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
