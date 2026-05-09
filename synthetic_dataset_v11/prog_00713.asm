; DESCRIPTION: Composite: . Then Renders a blue line between points (85, 101) and (244, 146). Then Places a white dot at position (226, 0).
; PLAN: r0=85(x1), r1=101(y1), r2=244(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=226(x), r1=0(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (85, 101) and (244, 146).
; PLAN: r0=85(x1), r1=101(y1), r2=244(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 101
LDI r2, 244
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (226, 0).
; PLAN: r0=226(x), r1=0(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 0
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
