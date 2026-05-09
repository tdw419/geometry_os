; DESCRIPTION: Draws a cyan rectangle at (150, 80) with width 115 and height 77.
; PLAN: r0=150(x), r1=80(y), r2=115(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 80
LDI r2, 115
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
