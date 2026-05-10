; DESCRIPTION: Draws a cyan rectangle at (100, 148) with width 84 and height 36.
; PLAN: r0=100(x), r1=148(y), r2=84(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 148
LDI r2, 84
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
