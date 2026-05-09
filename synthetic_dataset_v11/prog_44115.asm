; DESCRIPTION: Composite: . Then Places a orange dot at position (237, 242). Then Renders a magenta line between points (66, 37) and (164, 15).
; PLAN: r0=237(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=66(x1), r1=37(y1), r2=164(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (237, 242).
; PLAN: r0=237(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 242
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta line between points (66, 37) and (164, 15).
; PLAN: r0=66(x1), r1=37(y1), r2=164(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 37
LDI r2, 164
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
