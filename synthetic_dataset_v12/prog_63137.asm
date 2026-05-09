; DESCRIPTION: Renders a cyan disk with center (448, 67) and radius 53.
; PLAN: r0=448(x), r1=67(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 67
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
