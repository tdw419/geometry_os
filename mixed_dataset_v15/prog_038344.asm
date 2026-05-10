; DESCRIPTION: Renders a green disk with center (398, 77) and radius 56.
; PLAN: r0=398(x), r1=77(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 77
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
