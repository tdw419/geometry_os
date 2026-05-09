; DESCRIPTION: Places a yellow line segment connecting (177, 206) to (37, 146).
; PLAN: r0=177(x1), r1=206(y1), r2=37(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 206
LDI r2, 37
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
