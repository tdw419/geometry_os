; DESCRIPTION: Draws a cyan rectangle at (338, 16) with width 112 and height 94.
; PLAN: r0=338(x), r1=16(y), r2=112(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 16
LDI r2, 112
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
