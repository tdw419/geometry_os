; DESCRIPTION: Composite: . Then Renders a black line between points (66, 139) and (9, 255). Then Places a green dot at position (139, 26).
; PLAN: r0=66(x1), r1=139(y1), r2=9(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=139(x), r1=26(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (66, 139) and (9, 255).
; PLAN: r0=66(x1), r1=139(y1), r2=9(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 139
LDI r2, 9
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (139, 26).
; PLAN: r0=139(x), r1=26(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 26
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
