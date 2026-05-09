; DESCRIPTION: Draws a green line from (83, 208) to (65, 120).
; PLAN: r0=83(x1), r1=208(y1), r2=65(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 208
LDI r2, 65
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
