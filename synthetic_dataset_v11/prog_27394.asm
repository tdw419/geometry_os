; DESCRIPTION: Composite: . Then Places a green dot at position (244, 195). Then Places a green circle of radius 34 at center (36, 80).
; PLAN: r0=244(x), r1=195(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=36(x), r1=80(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (244, 195).
; PLAN: r0=244(x), r1=195(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 195
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a green circle of radius 34 at center (36, 80).
; PLAN: r0=36(x), r1=80(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 80
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
