; DESCRIPTION: Draws a yellow line from (73, 107) to (27, 169).
; PLAN: r0=73(x1), r1=107(y1), r2=27(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 107
LDI r2, 27
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
