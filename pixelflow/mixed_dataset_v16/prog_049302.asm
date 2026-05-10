; DESCRIPTION: Draws a cyan rectangle at (328, 106) with width 52 and height 106.
; PLAN: r0=328(x), r1=106(y), r2=52(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 106
LDI r2, 52
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
