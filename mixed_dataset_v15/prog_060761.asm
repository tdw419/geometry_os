; DESCRIPTION: Renders a purple box of size 79x20 starting at (247, 50).
; PLAN: r0=247(x), r1=50(y), r2=79(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 50
LDI r2, 79
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
