; DESCRIPTION: Places a purple circle of radius 18 at center (228, 205).
; PLAN: r0=228(x), r1=205(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 205
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
