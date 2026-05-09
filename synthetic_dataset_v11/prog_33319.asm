; DESCRIPTION: Renders a purple box of size 32x86 starting at (163, 158).
; PLAN: r0=163(x), r1=158(y), r2=32(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 158
LDI r2, 32
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
