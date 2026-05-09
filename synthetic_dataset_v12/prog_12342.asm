; DESCRIPTION: Draws a yellow rectangle at (212, 143) with width 68 and height 83.
; PLAN: r0=212(x), r1=143(y), r2=68(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 143
LDI r2, 68
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
