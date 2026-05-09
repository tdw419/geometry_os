; DESCRIPTION: Composite: . Then Sets a single green pixel at (244, 96). Then Draws a white line from (219, 140) to (142, 238).
; PLAN: r0=244(x), r1=96(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=219(x1), r1=140(y1), r2=142(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (244, 96).
; PLAN: r0=244(x), r1=96(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 96
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (219, 140) to (142, 238).
; PLAN: r0=219(x1), r1=140(y1), r2=142(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 140
LDI r2, 142
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
