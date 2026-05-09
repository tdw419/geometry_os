; DESCRIPTION: Renders a purple disk with center (103, 186) and radius 27.
; PLAN: r0=103(x), r1=186(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 186
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
