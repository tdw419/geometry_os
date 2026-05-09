; DESCRIPTION: Draws a cyan rectangle at (194, 68) with width 108 and height 68.
; PLAN: r0=194(x), r1=68(y), r2=108(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 68
LDI r2, 108
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
