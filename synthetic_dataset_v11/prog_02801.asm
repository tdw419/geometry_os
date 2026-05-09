; DESCRIPTION: Composite: . Then Places a white dot at position (97, 12). Then Renders a white line between points (230, 242) and (136, 212).
; PLAN: r0=97(x), r1=12(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=230(x1), r1=242(y1), r2=136(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (97, 12).
; PLAN: r0=97(x), r1=12(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 97
LDI r1, 12
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a white line between points (230, 242) and (136, 212).
; PLAN: r0=230(x1), r1=242(y1), r2=136(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 242
LDI r2, 136
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
