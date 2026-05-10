; DESCRIPTION: Draws a green line from (439, 21) to (162, 7).
; PLAN: r0=439(x1), r1=21(y1), r2=162(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 21
LDI r2, 162
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
