; DESCRIPTION: Composite: . Then Draws a white line from (132, 200) to (227, 166). Then Sets a single magenta pixel at (242, 32).
; PLAN: r0=132(x1), r1=200(y1), r2=227(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=242(x), r1=32(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (132, 200) to (227, 166).
; PLAN: r0=132(x1), r1=200(y1), r2=227(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 200
LDI r2, 227
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (242, 32).
; PLAN: r0=242(x), r1=32(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 32
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
