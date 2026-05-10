; DESCRIPTION: Draws a yellow line from (370, 231) to (177, 242).
; PLAN: r0=370(x1), r1=231(y1), r2=177(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 231
LDI r2, 177
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
