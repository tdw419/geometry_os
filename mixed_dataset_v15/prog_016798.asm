; DESCRIPTION: Places a red disk with center (393, 55) and radius 39.
; PLAN: r0=393(x), r1=55(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 55
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
