; DESCRIPTION: Renders a purple box of size 109x79 starting at (128, 21).
; PLAN: r0=128(x), r1=21(y), r2=109(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 21
LDI r2, 109
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
