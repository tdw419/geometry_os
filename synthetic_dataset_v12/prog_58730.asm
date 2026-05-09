; DESCRIPTION: Draws a magenta line from (21, 242) to (242, 94).
; PLAN: r0=21(x1), r1=242(y1), r2=242(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 242
LDI r2, 242
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
