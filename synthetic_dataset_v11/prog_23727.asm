; DESCRIPTION: Composite: . Then Draws a magenta line from (227, 36) to (193, 69). Then Places a red dot at position (214, 6).
; PLAN: r0=227(x1), r1=36(y1), r2=193(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=214(x), r1=6(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (227, 36) to (193, 69).
; PLAN: r0=227(x1), r1=36(y1), r2=193(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 36
LDI r2, 193
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (214, 6).
; PLAN: r0=214(x), r1=6(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 6
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
