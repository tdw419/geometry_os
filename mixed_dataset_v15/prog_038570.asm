; DESCRIPTION: Draws a cyan rectangle at (254, 76) with width 64 and height 22.
; PLAN: r0=254(x), r1=76(y), r2=64(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 76
LDI r2, 64
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
