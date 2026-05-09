; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (138, 16) to (129, 168). Then Sets a single blue pixel at (81, 184).
; PLAN: r0=138(x1), r1=16(y1), r2=129(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=81(x), r1=184(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (138, 16) to (129, 168).
; PLAN: r0=138(x1), r1=16(y1), r2=129(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 16
LDI r2, 129
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (81, 184).
; PLAN: r0=81(x), r1=184(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 184
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
