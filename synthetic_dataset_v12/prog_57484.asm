; DESCRIPTION: Renders a purple box of size 31x21 starting at (160, 124).
; PLAN: r0=160(x), r1=124(y), r2=31(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 124
LDI r2, 31
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
