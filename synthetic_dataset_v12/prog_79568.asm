; DESCRIPTION: Draws a green line from (167, 6) to (408, 102).
; PLAN: r0=167(x1), r1=6(y1), r2=408(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 6
LDI r2, 408
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
