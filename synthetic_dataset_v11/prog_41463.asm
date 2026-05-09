; DESCRIPTION: Places a blue circle of radius 27 at center (36, 192).
; PLAN: r0=36(x), r1=192(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 192
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
