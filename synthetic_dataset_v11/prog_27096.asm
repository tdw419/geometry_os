; DESCRIPTION: Composite: . Then Draws a magenta line from (10, 22) to (72, 168). Then Sets a single black pixel at (9, 59).
; PLAN: r0=10(x1), r1=22(y1), r2=72(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=9(x), r1=59(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (10, 22) to (72, 168).
; PLAN: r0=10(x1), r1=22(y1), r2=72(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 22
LDI r2, 72
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (9, 59).
; PLAN: r0=9(x), r1=59(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 59
LDI r2, 0x000000
PSET r0, r1, r2
HALT
