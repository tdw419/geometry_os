; DESCRIPTION: Composite: . Then Sets a single purple pixel at (23, 223). Then Draws a yellow line from (154, 133) to (30, 131).
; PLAN: r0=23(x), r1=223(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=154(x1), r1=133(y1), r2=30(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (23, 223).
; PLAN: r0=23(x), r1=223(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 223
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (154, 133) to (30, 131).
; PLAN: r0=154(x1), r1=133(y1), r2=30(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 133
LDI r2, 30
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
