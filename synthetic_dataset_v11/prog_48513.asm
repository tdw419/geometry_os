; DESCRIPTION: Composite: . Then Places a red dot at position (23, 154). Then Draws a red line from (45, 214) to (26, 11).
; PLAN: r0=23(x), r1=154(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=45(x1), r1=214(y1), r2=26(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (23, 154).
; PLAN: r0=23(x), r1=154(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 154
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (45, 214) to (26, 11).
; PLAN: r0=45(x1), r1=214(y1), r2=26(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 214
LDI r2, 26
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
