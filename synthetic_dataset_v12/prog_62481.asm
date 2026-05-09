; DESCRIPTION: Draws a cyan rectangle at (379, 157) with width 22 and height 94.
; PLAN: r0=379(x), r1=157(y), r2=22(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 157
LDI r2, 22
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
