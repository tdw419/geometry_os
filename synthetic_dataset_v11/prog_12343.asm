; DESCRIPTION: Draws a green line from (102, 107) to (5, 165).
; PLAN: r0=102(x1), r1=107(y1), r2=5(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 107
LDI r2, 5
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
