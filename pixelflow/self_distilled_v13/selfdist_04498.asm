; DESCRIPTION: Places a green disk with center (121, 199) and radius 51.
; PLAN: r0=121(x), r1=199(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 199
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
