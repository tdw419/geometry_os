; DESCRIPTION: Places a green disk with center (116, 126) and radius 56.
; PLAN: r0=116(x), r1=126(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 126
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
