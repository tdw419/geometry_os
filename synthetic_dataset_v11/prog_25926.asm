; DESCRIPTION: Draws a cyan rectangle at (54, 160) with width 101 and height 33.
; PLAN: r0=54(x), r1=160(y), r2=101(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 160
LDI r2, 101
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
