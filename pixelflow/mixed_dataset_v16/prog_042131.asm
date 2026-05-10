; DESCRIPTION: Places a yellow disk with center (386, 197) and radius 35.
; PLAN: r0=386(x), r1=197(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 197
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
