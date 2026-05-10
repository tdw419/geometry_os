; DESCRIPTION: Draws a cyan rectangle at (38, 14) with width 84 and height 24.
; PLAN: r0=38(x), r1=14(y), r2=84(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 14
LDI r2, 84
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
