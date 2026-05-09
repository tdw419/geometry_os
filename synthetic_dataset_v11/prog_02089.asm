; DESCRIPTION: Composite: . Then Places a purple dot at position (192, 134). Then Renders a cyan line between points (44, 164) and (82, 12).
; PLAN: r0=192(x), r1=134(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=44(x1), r1=164(y1), r2=82(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (192, 134).
; PLAN: r0=192(x), r1=134(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 134
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (44, 164) and (82, 12).
; PLAN: r0=44(x1), r1=164(y1), r2=82(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 164
LDI r2, 82
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
