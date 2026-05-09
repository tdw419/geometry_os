; DESCRIPTION: Draws a cyan rectangle at (38, 62) with width 26 and height 12.
; PLAN: r0=38(x), r1=62(y), r2=26(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 62
LDI r2, 26
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
