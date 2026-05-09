; DESCRIPTION: Draws a cyan rectangle at (240, 52) with width 115 and height 87.
; PLAN: r0=240(x), r1=52(y), r2=115(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 52
LDI r2, 115
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
