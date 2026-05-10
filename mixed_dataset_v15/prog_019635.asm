; DESCRIPTION: Draws a orange rectangle at (322, 141) with width 68 and height 34.
; PLAN: r0=322(x), r1=141(y), r2=68(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 141
LDI r2, 68
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
