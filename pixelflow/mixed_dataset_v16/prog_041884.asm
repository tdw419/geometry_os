; DESCRIPTION: Draws a green rectangle at (237, 180) with width 99 and height 21.
; PLAN: r0=237(x), r1=180(y), r2=99(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 180
LDI r2, 99
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
