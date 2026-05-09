; DESCRIPTION: Renders a magenta box of size 14x20 starting at (124, 128).
; PLAN: r0=124(x), r1=128(y), r2=14(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 128
LDI r2, 14
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
