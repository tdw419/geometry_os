; DESCRIPTION: Draws a cyan rectangle at (201, 36) with width 116 and height 35.
; PLAN: r0=201(x), r1=36(y), r2=116(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 36
LDI r2, 116
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
