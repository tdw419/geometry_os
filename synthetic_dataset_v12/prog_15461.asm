; DESCRIPTION: Draws a magenta line from (202, 48) to (343, 41).
; PLAN: r0=202(x1), r1=48(y1), r2=343(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 48
LDI r2, 343
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
