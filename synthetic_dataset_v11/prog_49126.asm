; DESCRIPTION: Composite: . Then Renders a red line between points (249, 27) and (141, 64). Then Places a white dot at position (95, 173).
; PLAN: r0=249(x1), r1=27(y1), r2=141(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=173(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red line between points (249, 27) and (141, 64).
; PLAN: r0=249(x1), r1=27(y1), r2=141(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 27
LDI r2, 141
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (95, 173).
; PLAN: r0=95(x), r1=173(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 173
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
