; DESCRIPTION: Draws a green line from (138, 107) to (196, 11).
; PLAN: r0=138(x1), r1=107(y1), r2=196(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 107
LDI r2, 196
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
