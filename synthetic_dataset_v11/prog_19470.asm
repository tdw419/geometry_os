; DESCRIPTION: Composite: . Then Places a white dot at position (21, 126). Then Renders a red line between points (81, 83) and (167, 14).
; PLAN: r0=21(x), r1=126(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=81(x1), r1=83(y1), r2=167(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (21, 126).
; PLAN: r0=21(x), r1=126(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 126
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (81, 83) and (167, 14).
; PLAN: r0=81(x1), r1=83(y1), r2=167(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 83
LDI r2, 167
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
