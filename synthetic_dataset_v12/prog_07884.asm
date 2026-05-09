; DESCRIPTION: Renders a purple box of size 87x36 starting at (288, 117).
; PLAN: r0=288(x), r1=117(y), r2=87(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 117
LDI r2, 87
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
