; DESCRIPTION: Draws a green line from (92, 188) to (191, 207).
; PLAN: r0=92(x1), r1=188(y1), r2=191(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 188
LDI r2, 191
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
