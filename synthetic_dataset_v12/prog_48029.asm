; DESCRIPTION: Draws a green line from (20, 208) to (57, 200).
; PLAN: r0=20(x1), r1=208(y1), r2=57(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 208
LDI r2, 57
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
