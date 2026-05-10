; DESCRIPTION: Draws a magenta line from (294, 58) to (98, 179).
; PLAN: r0=294(x1), r1=58(y1), r2=98(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 58
LDI r2, 98
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
