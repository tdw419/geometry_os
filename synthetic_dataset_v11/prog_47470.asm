; DESCRIPTION: Draws a cyan line from (249, 201) to (188, 163).
; PLAN: r0=249(x1), r1=201(y1), r2=188(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 201
LDI r2, 188
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
