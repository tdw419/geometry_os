; DESCRIPTION: Composite: . Then Renders a magenta line between points (110, 178) and (112, 157). Then Places a cyan dot at position (19, 226).
; PLAN: r0=110(x1), r1=178(y1), r2=112(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=19(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (110, 178) and (112, 157).
; PLAN: r0=110(x1), r1=178(y1), r2=112(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 178
LDI r2, 112
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (19, 226).
; PLAN: r0=19(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 226
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
