; DESCRIPTION: Composite: . Then Renders a magenta line between points (151, 32) and (65, 93). Then Sets a single green pixel at (82, 89).
; PLAN: r0=151(x1), r1=32(y1), r2=65(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=82(x), r1=89(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (151, 32) and (65, 93).
; PLAN: r0=151(x1), r1=32(y1), r2=65(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 32
LDI r2, 65
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (82, 89).
; PLAN: r0=82(x), r1=89(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 89
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
