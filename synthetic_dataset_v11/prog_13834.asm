; DESCRIPTION: Composite: . Then Places a yellow dot at position (163, 137). Then Renders a black line between points (37, 116) and (231, 94).
; PLAN: r0=163(x), r1=137(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=37(x1), r1=116(y1), r2=231(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (163, 137).
; PLAN: r0=163(x), r1=137(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 137
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a black line between points (37, 116) and (231, 94).
; PLAN: r0=37(x1), r1=116(y1), r2=231(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 116
LDI r2, 231
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
