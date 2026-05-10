; DESCRIPTION: Places a green disk with center (148, 27) and radius 50.
; PLAN: r0=148(x), r1=27(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 27
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
