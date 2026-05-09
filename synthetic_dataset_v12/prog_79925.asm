; DESCRIPTION: Draws a cyan rectangle at (199, 8) with width 86 and height 33.
; PLAN: r0=199(x), r1=8(y), r2=86(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 8
LDI r2, 86
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
