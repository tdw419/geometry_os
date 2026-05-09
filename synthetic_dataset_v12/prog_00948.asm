; DESCRIPTION: Draws a green line from (208, 80) to (202, 15).
; PLAN: r0=208(x1), r1=80(y1), r2=202(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 80
LDI r2, 202
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
