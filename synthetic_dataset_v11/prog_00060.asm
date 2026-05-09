; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (53, 32). Then Renders a white line between points (193, 120) and (169, 109).
; PLAN: r0=53(x), r1=32(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=193(x1), r1=120(y1), r2=169(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (53, 32).
; PLAN: r0=53(x), r1=32(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 32
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a white line between points (193, 120) and (169, 109).
; PLAN: r0=193(x1), r1=120(y1), r2=169(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 120
LDI r2, 169
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
