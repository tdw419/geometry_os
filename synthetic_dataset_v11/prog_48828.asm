; DESCRIPTION: Renders a purple box of size 73x52 starting at (128, 133).
; PLAN: r0=128(x), r1=133(y), r2=73(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 133
LDI r2, 73
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
