; DESCRIPTION: Composite: . Then Sets a single orange pixel at (63, 223). Then Renders a magenta line between points (100, 227) and (154, 59).
; PLAN: r0=63(x), r1=223(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=100(x1), r1=227(y1), r2=154(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (63, 223).
; PLAN: r0=63(x), r1=223(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 223
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta line between points (100, 227) and (154, 59).
; PLAN: r0=100(x1), r1=227(y1), r2=154(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 227
LDI r2, 154
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
