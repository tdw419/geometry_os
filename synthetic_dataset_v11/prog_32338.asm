; DESCRIPTION: Renders a purple box of size 64x55 starting at (23, 135).
; PLAN: r0=23(x), r1=135(y), r2=64(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 135
LDI r2, 64
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
