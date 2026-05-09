; DESCRIPTION: Composite: . Then Sets a single purple pixel at (223, 173). Then Renders a blue line between points (63, 26) and (255, 82).
; PLAN: r0=223(x), r1=173(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=63(x1), r1=26(y1), r2=255(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (223, 173).
; PLAN: r0=223(x), r1=173(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 173
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (63, 26) and (255, 82).
; PLAN: r0=63(x1), r1=26(y1), r2=255(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 26
LDI r2, 255
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
