; DESCRIPTION: Renders a purple box of size 33x33 starting at (291, 150).
; PLAN: r0=291(x), r1=150(y), r2=33(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 150
LDI r2, 33
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
