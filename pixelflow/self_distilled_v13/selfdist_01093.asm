; DESCRIPTION: Draws a magenta line from (131, 26) to (384, 0).
; PLAN: r0=131(x1), r1=26(y1), r2=384(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 26
LDI r2, 384
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
