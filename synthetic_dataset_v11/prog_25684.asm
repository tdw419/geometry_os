; DESCRIPTION: Composite: . Then Places a cyan dot at position (89, 176). Then Places a red line segment connecting (184, 189) to (186, 180).
; PLAN: r0=89(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=184(x1), r1=189(y1), r2=186(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (89, 176).
; PLAN: r0=89(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 176
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (184, 189) to (186, 180).
; PLAN: r0=184(x1), r1=189(y1), r2=186(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 189
LDI r2, 186
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
