; DESCRIPTION: Draws a blue rectangle at (27, 109) with width 48 and height 45.
; PLAN: r0=27(x), r1=109(y), r2=48(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 109
LDI r2, 48
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
