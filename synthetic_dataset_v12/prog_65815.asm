; DESCRIPTION: Renders a purple box of size 84x10 starting at (120, 179).
; PLAN: r0=120(x), r1=179(y), r2=84(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 179
LDI r2, 84
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
