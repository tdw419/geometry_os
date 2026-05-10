; DESCRIPTION: Renders a yellow disk with center (255, 68) and radius 33.
; PLAN: r0=255(x), r1=68(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 68
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
