; DESCRIPTION: Composite: . Then Renders a magenta line between points (71, 23) and (11, 10). Then Places a yellow dot at position (231, 242).
; PLAN: r0=71(x1), r1=23(y1), r2=11(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=231(x), r1=242(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (71, 23) and (11, 10).
; PLAN: r0=71(x1), r1=23(y1), r2=11(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 23
LDI r2, 11
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (231, 242).
; PLAN: r0=231(x), r1=242(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 242
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
