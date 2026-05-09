; DESCRIPTION: Draws a cyan rectangle at (79, 60) with width 35 and height 115.
; PLAN: r0=79(x), r1=60(y), r2=35(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 60
LDI r2, 35
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
