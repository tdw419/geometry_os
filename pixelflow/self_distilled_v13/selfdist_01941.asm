; DESCRIPTION: Places a red disk with center (393, 24) and radius 27.
; PLAN: r0=393(x), r1=24(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 24
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
