; DESCRIPTION: Renders a yellow disk with center (126, 152) and radius 57.
; PLAN: r0=126(x), r1=152(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 152
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
