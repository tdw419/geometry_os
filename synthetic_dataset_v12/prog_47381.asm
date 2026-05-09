; DESCRIPTION: Renders a red disk with center (328, 135) and radius 45.
; PLAN: r0=328(x), r1=135(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 135
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
