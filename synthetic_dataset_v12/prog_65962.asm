; DESCRIPTION: Draws a cyan rectangle at (296, 22) with width 31 and height 120.
; PLAN: r0=296(x), r1=22(y), r2=31(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 22
LDI r2, 31
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
