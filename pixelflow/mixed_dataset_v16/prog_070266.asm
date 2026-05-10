; DESCRIPTION: Draws a magenta line from (502, 179) to (91, 71).
; PLAN: r0=502(x1), r1=179(y1), r2=91(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 179
LDI r2, 91
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
