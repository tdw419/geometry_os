; DESCRIPTION: Draws a cyan rectangle at (309, 100) with width 75 and height 93.
; PLAN: r0=309(x), r1=100(y), r2=75(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 100
LDI r2, 75
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
