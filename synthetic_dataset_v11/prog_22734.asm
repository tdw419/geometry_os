; DESCRIPTION: Draws a magenta line from (111, 177) to (32, 109).
; PLAN: r0=111(x1), r1=177(y1), r2=32(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 177
LDI r2, 32
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
