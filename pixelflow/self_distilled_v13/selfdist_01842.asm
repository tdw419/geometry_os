; DESCRIPTION: Places a cyan disk with center (106, 69) and radius 52.
; PLAN: r0=106(x), r1=69(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 69
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
