; DESCRIPTION: Renders a yellow disk with center (180, 154) and radius 55.
; PLAN: r0=180(x), r1=154(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 154
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
