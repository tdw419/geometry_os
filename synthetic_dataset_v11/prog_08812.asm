; DESCRIPTION: Draws a cyan rectangle at (34, 150) with width 84 and height 105.
; PLAN: r0=34(x), r1=150(y), r2=84(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 150
LDI r2, 84
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
