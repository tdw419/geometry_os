; DESCRIPTION: Renders a blue box of size 60x59 starting at (219, 24).
; PLAN: r0=219(x), r1=24(y), r2=60(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 24
LDI r2, 60
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
