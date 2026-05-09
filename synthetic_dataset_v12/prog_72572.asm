; DESCRIPTION: Renders a cyan disk with center (393, 131) and radius 75.
; PLAN: r0=393(x), r1=131(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 131
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
