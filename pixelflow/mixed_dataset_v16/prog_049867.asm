; DESCRIPTION: Places a black circle of radius 68 at center (271, 126).
; PLAN: r0=271(x), r1=126(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 126
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
