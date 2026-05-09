; DESCRIPTION: Draws a cyan rectangle at (24, 144) with width 106 and height 96.
; PLAN: r0=24(x), r1=144(y), r2=106(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 144
LDI r2, 106
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
