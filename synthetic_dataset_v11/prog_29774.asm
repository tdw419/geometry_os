; DESCRIPTION: Composite: . Then Places a red line segment connecting (73, 125) to (242, 14). Then Places a white dot at position (173, 169).
; PLAN: r0=73(x1), r1=125(y1), r2=242(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=173(x), r1=169(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (73, 125) to (242, 14).
; PLAN: r0=73(x1), r1=125(y1), r2=242(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 125
LDI r2, 242
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (173, 169).
; PLAN: r0=173(x), r1=169(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 169
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
