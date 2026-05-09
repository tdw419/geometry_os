; DESCRIPTION: Renders a purple box of size 86x58 starting at (112, 128).
; PLAN: r0=112(x), r1=128(y), r2=86(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 128
LDI r2, 86
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
