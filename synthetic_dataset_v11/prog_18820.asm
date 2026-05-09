; DESCRIPTION: Draws a green line from (146, 10) to (83, 90).
; PLAN: r0=146(x1), r1=10(y1), r2=83(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 10
LDI r2, 83
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
