; DESCRIPTION: Renders a purple box of size 87x27 starting at (40, 4).
; PLAN: r0=40(x), r1=4(y), r2=87(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 4
LDI r2, 87
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
