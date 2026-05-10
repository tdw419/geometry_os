; DESCRIPTION: Places a cyan disk with center (91, 106) and radius 58.
; PLAN: r0=91(x), r1=106(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 106
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
