; DESCRIPTION: Draws a blue rectangle at (224, 71) with width 22 and height 48.
; PLAN: r0=224(x), r1=71(y), r2=22(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 71
LDI r2, 22
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
