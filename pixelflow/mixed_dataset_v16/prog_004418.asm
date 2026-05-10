; DESCRIPTION: Renders a cyan disk with center (428, 72) and radius 31.
; PLAN: r0=428(x), r1=72(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 72
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
