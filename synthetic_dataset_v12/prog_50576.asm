; DESCRIPTION: Draws a green line from (54, 61) to (369, 86).
; PLAN: r0=54(x1), r1=61(y1), r2=369(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 61
LDI r2, 369
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
