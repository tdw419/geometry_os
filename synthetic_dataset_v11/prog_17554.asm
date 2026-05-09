; DESCRIPTION: Composite: . Then Renders a orange line between points (156, 79) and (74, 72). Then Places a green dot at position (195, 144).
; PLAN: r0=156(x1), r1=79(y1), r2=74(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=195(x), r1=144(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (156, 79) and (74, 72).
; PLAN: r0=156(x1), r1=79(y1), r2=74(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 79
LDI r2, 74
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (195, 144).
; PLAN: r0=195(x), r1=144(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 144
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
