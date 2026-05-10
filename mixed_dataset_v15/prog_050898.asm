; DESCRIPTION: Draws a cyan rectangle at (301, 49) with width 68 and height 55.
; PLAN: r0=301(x), r1=49(y), r2=68(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 49
LDI r2, 68
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
