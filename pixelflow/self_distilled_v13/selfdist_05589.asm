; DESCRIPTION: Draws a cyan rectangle at (47, 158) with width 55 and height 48.
; PLAN: r0=47(x), r1=158(y), r2=55(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 158
LDI r2, 55
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
