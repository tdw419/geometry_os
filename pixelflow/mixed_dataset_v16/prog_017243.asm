; DESCRIPTION: Places a purple circle of radius 77 at center (103, 126).
; PLAN: r0=103(x), r1=126(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 126
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
