; DESCRIPTION: Draws a magenta line from (189, 231) to (153, 177).
; PLAN: r0=189(x1), r1=231(y1), r2=153(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 231
LDI r2, 153
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
