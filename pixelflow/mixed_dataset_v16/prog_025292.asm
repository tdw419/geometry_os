; DESCRIPTION: Places a green disk with center (193, 153) and radius 46.
; PLAN: r0=193(x), r1=153(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 153
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
