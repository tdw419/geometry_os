; DESCRIPTION: Renders a purple box of size 81x59 starting at (64, 117).
; PLAN: r0=64(x), r1=117(y), r2=81(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 117
LDI r2, 81
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
