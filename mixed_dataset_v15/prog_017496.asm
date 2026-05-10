; DESCRIPTION: Places a purple circle of radius 22 at center (237, 154).
; PLAN: r0=237(x), r1=154(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 154
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
