; DESCRIPTION: Composite: . Then Renders a green line between points (141, 94) and (107, 164). Then Sets a single white pixel at (204, 244).
; PLAN: r0=141(x1), r1=94(y1), r2=107(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=204(x), r1=244(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (141, 94) and (107, 164).
; PLAN: r0=141(x1), r1=94(y1), r2=107(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 94
LDI r2, 107
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (204, 244).
; PLAN: r0=204(x), r1=244(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 244
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
