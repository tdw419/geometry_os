; DESCRIPTION: Draws a green line from (423, 102) to (291, 132).
; PLAN: r0=423(x1), r1=102(y1), r2=291(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 102
LDI r2, 291
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
