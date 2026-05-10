; DESCRIPTION: Draws a cyan rectangle at (343, 174) with width 87 and height 60.
; PLAN: r0=343(x), r1=174(y), r2=87(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 174
LDI r2, 87
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
