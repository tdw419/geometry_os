; DESCRIPTION: Places a green circle of radius 10 at center (208, 135).
; PLAN: r0=208(x), r1=135(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 135
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
