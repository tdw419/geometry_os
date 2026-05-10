; DESCRIPTION: Draws a magenta line from (341, 47) to (328, 76).
; PLAN: r0=341(x1), r1=47(y1), r2=328(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 47
LDI r2, 328
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
