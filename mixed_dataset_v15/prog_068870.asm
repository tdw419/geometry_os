; DESCRIPTION: Renders a red disk with center (280, 124) and radius 64.
; PLAN: r0=280(x), r1=124(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 124
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
