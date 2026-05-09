; DESCRIPTION: Composite: . Then Places a green circle of radius 31 at center (199, 33). Then Places a red dot at position (188, 46).
; PLAN: r0=199(x), r1=33(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=188(x), r1=46(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green circle of radius 31 at center (199, 33).
; PLAN: r0=199(x), r1=33(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 33
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (188, 46).
; PLAN: r0=188(x), r1=46(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 46
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
