; DESCRIPTION: Draws a yellow line from (129, 179) to (154, 132).
; PLAN: r0=129(x1), r1=179(y1), r2=154(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 179
LDI r2, 154
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
