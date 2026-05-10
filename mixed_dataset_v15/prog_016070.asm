; DESCRIPTION: Draws a black rectangle at (225, 83) with width 31 and height 50.
; PLAN: r0=225(x), r1=83(y), r2=31(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 83
LDI r2, 31
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
