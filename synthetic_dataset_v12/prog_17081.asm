; DESCRIPTION: Places a red line segment connecting (103, 97) to (439, 209).
; PLAN: r0=103(x1), r1=97(y1), r2=439(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 97
LDI r2, 439
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
