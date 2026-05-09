; DESCRIPTION: Draws a cyan rectangle at (93, 192) with width 57 and height 45.
; PLAN: r0=93(x), r1=192(y), r2=57(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 192
LDI r2, 57
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
