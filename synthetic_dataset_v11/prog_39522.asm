; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (82, 95). Then Draws a white line from (115, 169) to (168, 130).
; PLAN: r0=82(x), r1=95(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=115(x1), r1=169(y1), r2=168(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (82, 95).
; PLAN: r0=82(x), r1=95(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 95
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (115, 169) to (168, 130).
; PLAN: r0=115(x1), r1=169(y1), r2=168(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 169
LDI r2, 168
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
