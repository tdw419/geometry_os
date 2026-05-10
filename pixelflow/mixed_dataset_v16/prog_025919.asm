; DESCRIPTION: Draws a blue rectangle at (458, 144) with width 40 and height 68.
; PLAN: r0=458(x), r1=144(y), r2=40(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 144
LDI r2, 40
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
