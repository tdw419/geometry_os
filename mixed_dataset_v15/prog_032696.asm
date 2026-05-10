; DESCRIPTION: Places a cyan disk with center (300, 160) and radius 15.
; PLAN: r0=300(x), r1=160(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 160
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
