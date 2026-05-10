; DESCRIPTION: Places a yellow disk with center (180, 112) and radius 22.
; PLAN: r0=180(x), r1=112(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 112
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
