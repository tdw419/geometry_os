; DESCRIPTION: Composite: . Then Places a cyan dot at position (56, 234). Then Draws a magenta line from (106, 83) to (109, 114).
; PLAN: r0=56(x), r1=234(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=106(x1), r1=83(y1), r2=109(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (56, 234).
; PLAN: r0=56(x), r1=234(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 234
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta line from (106, 83) to (109, 114).
; PLAN: r0=106(x1), r1=83(y1), r2=109(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 83
LDI r2, 109
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
