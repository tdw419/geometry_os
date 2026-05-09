; DESCRIPTION: Renders a purple box of size 11x33 starting at (374, 44).
; PLAN: r0=374(x), r1=44(y), r2=11(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 44
LDI r2, 11
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
