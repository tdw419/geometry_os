; DESCRIPTION: Composite: . Then Sets a single purple pixel at (154, 189). Then Renders a cyan line between points (82, 50) and (97, 196).
; PLAN: r0=154(x), r1=189(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=82(x1), r1=50(y1), r2=97(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (154, 189).
; PLAN: r0=154(x), r1=189(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 189
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (82, 50) and (97, 196).
; PLAN: r0=82(x1), r1=50(y1), r2=97(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 50
LDI r2, 97
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
