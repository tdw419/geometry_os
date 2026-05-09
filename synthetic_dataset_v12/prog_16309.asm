; DESCRIPTION: Draws a cyan rectangle at (178, 180) with width 115 and height 33.
; PLAN: r0=178(x), r1=180(y), r2=115(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 180
LDI r2, 115
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
