; DESCRIPTION: Composite: . Then Places a black dot at position (227, 223). Then Renders a blue line between points (143, 199) and (33, 233).
; PLAN: r0=227(x), r1=223(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=143(x1), r1=199(y1), r2=33(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (227, 223).
; PLAN: r0=227(x), r1=223(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 223
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (143, 199) and (33, 233).
; PLAN: r0=143(x1), r1=199(y1), r2=33(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 199
LDI r2, 33
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
