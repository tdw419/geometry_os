; DESCRIPTION: Renders a purple box of size 64x87 starting at (82, 2).
; PLAN: r0=82(x), r1=2(y), r2=64(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 2
LDI r2, 64
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
