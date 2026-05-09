; DESCRIPTION: Creates a green circular shape at (126, 194) with radius 25.
; PLAN: r0=126(x), r1=194(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 194
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
