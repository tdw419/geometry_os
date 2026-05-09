; DESCRIPTION: Draws a green line from (49, 188) to (148, 231).
; PLAN: r0=49(x1), r1=188(y1), r2=148(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 188
LDI r2, 148
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
