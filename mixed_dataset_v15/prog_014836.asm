; DESCRIPTION: Draws a black rectangle at (409, 150) with width 94 and height 45.
; PLAN: r0=409(x), r1=150(y), r2=94(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 150
LDI r2, 94
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
