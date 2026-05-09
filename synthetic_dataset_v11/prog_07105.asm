; DESCRIPTION: Composite: . Then Renders a red line between points (142, 224) and (11, 141). Then Sets a single green pixel at (32, 54).
; PLAN: r0=142(x1), r1=224(y1), r2=11(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=32(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red line between points (142, 224) and (11, 141).
; PLAN: r0=142(x1), r1=224(y1), r2=11(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 224
LDI r2, 11
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (32, 54).
; PLAN: r0=32(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 54
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
