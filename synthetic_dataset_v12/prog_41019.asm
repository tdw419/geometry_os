; DESCRIPTION: Draws a magenta line from (118, 206) to (294, 234).
; PLAN: r0=118(x1), r1=206(y1), r2=294(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 206
LDI r2, 294
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
