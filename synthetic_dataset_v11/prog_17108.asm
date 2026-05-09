; DESCRIPTION: Composite: . Then Renders a red line between points (45, 124) and (115, 101). Then Places a cyan dot at position (36, 14).
; PLAN: r0=45(x1), r1=124(y1), r2=115(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=36(x), r1=14(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red line between points (45, 124) and (115, 101).
; PLAN: r0=45(x1), r1=124(y1), r2=115(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 124
LDI r2, 115
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (36, 14).
; PLAN: r0=36(x), r1=14(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 14
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
