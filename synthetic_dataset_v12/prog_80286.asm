; DESCRIPTION: Renders a purple box of size 10x38 starting at (5, 206).
; PLAN: r0=5(x), r1=206(y), r2=10(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 206
LDI r2, 10
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
