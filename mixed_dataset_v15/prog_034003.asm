; DESCRIPTION: Draws a cyan rectangle at (133, 27) with width 115 and height 15.
; PLAN: r0=133(x), r1=27(y), r2=115(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 27
LDI r2, 115
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
