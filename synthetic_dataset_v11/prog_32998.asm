; DESCRIPTION: Composite: . Then Places a magenta dot at position (218, 123). Then Renders a blue line between points (150, 28) and (163, 102).
; PLAN: r0=218(x), r1=123(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=150(x1), r1=28(y1), r2=163(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (218, 123).
; PLAN: r0=218(x), r1=123(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 123
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (150, 28) and (163, 102).
; PLAN: r0=150(x1), r1=28(y1), r2=163(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 28
LDI r2, 163
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
