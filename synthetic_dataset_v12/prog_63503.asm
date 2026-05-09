; DESCRIPTION: Draws a cyan rectangle at (62, 52) with width 38 and height 48.
; PLAN: r0=62(x), r1=52(y), r2=38(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 52
LDI r2, 38
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
