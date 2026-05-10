; DESCRIPTION: Draws a magenta line from (264, 242) to (98, 10).
; PLAN: r0=264(x1), r1=242(y1), r2=98(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 242
LDI r2, 98
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
