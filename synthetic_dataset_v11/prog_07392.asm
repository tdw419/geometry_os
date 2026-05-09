; DESCRIPTION: Draws a green line from (153, 244) to (94, 231).
; PLAN: r0=153(x1), r1=244(y1), r2=94(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 244
LDI r2, 94
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
