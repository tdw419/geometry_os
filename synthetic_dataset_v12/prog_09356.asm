; DESCRIPTION: Draws a cyan rectangle at (206, 110) with width 64 and height 52.
; PLAN: r0=206(x), r1=110(y), r2=64(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 110
LDI r2, 64
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
