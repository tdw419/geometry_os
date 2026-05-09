; DESCRIPTION: Renders a purple box of size 31x20 starting at (441, 46).
; PLAN: r0=441(x), r1=46(y), r2=31(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 46
LDI r2, 31
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
