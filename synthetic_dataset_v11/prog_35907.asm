; DESCRIPTION: Draws a cyan rectangle at (93, 174) with width 94 and height 39.
; PLAN: r0=93(x), r1=174(y), r2=94(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 174
LDI r2, 94
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
