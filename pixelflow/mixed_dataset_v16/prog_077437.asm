; DESCRIPTION: Renders a cyan disk with center (201, 111) and radius 67.
; PLAN: r0=201(x), r1=111(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 111
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
