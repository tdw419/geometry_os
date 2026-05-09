; DESCRIPTION: Draws a cyan rectangle at (55, 134) with width 93 and height 84.
; PLAN: r0=55(x), r1=134(y), r2=93(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 134
LDI r2, 93
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
