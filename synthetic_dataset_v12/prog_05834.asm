; DESCRIPTION: Places a green line segment connecting (283, 236) to (10, 146).
; PLAN: r0=283(x1), r1=236(y1), r2=10(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 236
LDI r2, 10
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
