; DESCRIPTION: Renders a purple box of size 101x64 starting at (337, 109).
; PLAN: r0=337(x), r1=109(y), r2=101(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 109
LDI r2, 101
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
