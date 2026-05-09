; DESCRIPTION: Draws a magenta line from (189, 3) to (242, 105).
; PLAN: r0=189(x1), r1=3(y1), r2=242(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 3
LDI r2, 242
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
