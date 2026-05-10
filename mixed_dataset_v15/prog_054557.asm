; DESCRIPTION: Draws a cyan rectangle at (95, 144) with width 85 and height 73.
; PLAN: r0=95(x), r1=144(y), r2=85(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 144
LDI r2, 85
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
