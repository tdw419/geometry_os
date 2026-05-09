; DESCRIPTION: Draws a blue rectangle at (237, 180) with width 27 and height 24.
; PLAN: r0=237(x), r1=180(y), r2=27(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 180
LDI r2, 27
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
