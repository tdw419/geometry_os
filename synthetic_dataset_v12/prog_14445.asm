; DESCRIPTION: Renders a purple disk with center (405, 172) and radius 27.
; PLAN: r0=405(x), r1=172(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 172
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
