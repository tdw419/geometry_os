; DESCRIPTION: Draws a cyan rectangle at (133, 1) with width 38 and height 24.
; PLAN: r0=133(x), r1=1(y), r2=38(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 1
LDI r2, 38
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
