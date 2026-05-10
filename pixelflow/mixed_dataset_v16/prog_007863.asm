; DESCRIPTION: Draws a cyan rectangle at (377, 125) with width 106 and height 77.
; PLAN: r0=377(x), r1=125(y), r2=106(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 125
LDI r2, 106
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
