; DESCRIPTION: Renders a purple box of size 94x85 starting at (291, 124).
; PLAN: r0=291(x), r1=124(y), r2=94(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 124
LDI r2, 94
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
