; DESCRIPTION: Draws a cyan rectangle at (113, 94) with width 52 and height 45.
; PLAN: r0=113(x), r1=94(y), r2=52(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 94
LDI r2, 52
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
