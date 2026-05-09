; DESCRIPTION: Composite: . Then Places a yellow dot at position (70, 244). Then Renders a yellow line between points (60, 7) and (204, 76).
; PLAN: r0=70(x), r1=244(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=60(x1), r1=7(y1), r2=204(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (70, 244).
; PLAN: r0=70(x), r1=244(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 244
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow line between points (60, 7) and (204, 76).
; PLAN: r0=60(x1), r1=7(y1), r2=204(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 7
LDI r2, 204
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
