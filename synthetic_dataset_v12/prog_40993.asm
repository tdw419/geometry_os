; DESCRIPTION: Places a purple circle of radius 68 at center (126, 154).
; PLAN: r0=126(x), r1=154(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 154
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
