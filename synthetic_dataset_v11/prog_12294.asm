; DESCRIPTION: Draws a cyan rectangle at (201, 50) with width 17 and height 52.
; PLAN: r0=201(x), r1=50(y), r2=17(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 50
LDI r2, 17
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
