; DESCRIPTION: Draws a green line from (146, 234) to (505, 160).
; PLAN: r0=146(x1), r1=234(y1), r2=505(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 234
LDI r2, 505
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
