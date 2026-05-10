; DESCRIPTION: Places a cyan disk with center (386, 40) and radius 22.
; PLAN: r0=386(x), r1=40(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 40
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
