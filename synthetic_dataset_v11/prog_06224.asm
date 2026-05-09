; DESCRIPTION: Composite: . Then Places a cyan dot at position (71, 167). Then Draws a magenta line from (87, 66) to (100, 144).
; PLAN: r0=71(x), r1=167(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=87(x1), r1=66(y1), r2=100(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (71, 167).
; PLAN: r0=71(x), r1=167(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 167
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta line from (87, 66) to (100, 144).
; PLAN: r0=87(x1), r1=66(y1), r2=100(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 66
LDI r2, 100
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
