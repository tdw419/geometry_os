; DESCRIPTION: Draws a cyan rectangle at (137, 113) with width 64 and height 14.
; PLAN: r0=137(x), r1=113(y), r2=64(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 113
LDI r2, 64
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
