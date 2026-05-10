; DESCRIPTION: Draws a green line from (294, 188) to (186, 148).
; PLAN: r0=294(x1), r1=188(y1), r2=186(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 188
LDI r2, 186
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
