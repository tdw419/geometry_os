; DESCRIPTION: Composite: . Then Places a blue line segment connecting (2, 223) to (245, 59). Then Sets a single magenta pixel at (223, 6).
; PLAN: r0=2(x1), r1=223(y1), r2=245(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=223(x), r1=6(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue line segment connecting (2, 223) to (245, 59).
; PLAN: r0=2(x1), r1=223(y1), r2=245(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 223
LDI r2, 245
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (223, 6).
; PLAN: r0=223(x), r1=6(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 6
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
