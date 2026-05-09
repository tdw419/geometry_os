; DESCRIPTION: Renders a purple box of size 12x84 starting at (421, 113).
; PLAN: r0=421(x), r1=113(y), r2=12(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 113
LDI r2, 12
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
