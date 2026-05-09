; DESCRIPTION: Draws a green line from (81, 231) to (248, 200).
; PLAN: r0=81(x1), r1=231(y1), r2=248(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 231
LDI r2, 248
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
