; DESCRIPTION: Draws a green line from (129, 36) to (138, 87).
; PLAN: r0=129(x1), r1=36(y1), r2=138(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 36
LDI r2, 138
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
