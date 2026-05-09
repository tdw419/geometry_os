; DESCRIPTION: Draws a green line from (245, 95) to (505, 9).
; PLAN: r0=245(x1), r1=95(y1), r2=505(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 95
LDI r2, 505
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
