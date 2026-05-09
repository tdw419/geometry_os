; DESCRIPTION: Draws a yellow line from (331, 216) to (392, 243).
; PLAN: r0=331(x1), r1=216(y1), r2=392(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 216
LDI r2, 392
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
