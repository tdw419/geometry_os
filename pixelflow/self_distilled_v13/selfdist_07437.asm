; DESCRIPTION: Places a cyan disk with center (292, 185) and radius 29.
; PLAN: r0=292(x), r1=185(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 185
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
