; DESCRIPTION: Renders a blue box of size 64x11 starting at (127, 127).
; PLAN: r0=127(x), r1=127(y), r2=64(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 127
LDI r2, 64
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
