; DESCRIPTION: Draws a green line from (54, 168) to (489, 37).
; PLAN: r0=54(x1), r1=168(y1), r2=489(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 168
LDI r2, 489
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
