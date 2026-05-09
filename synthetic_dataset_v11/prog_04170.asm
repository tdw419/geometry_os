; DESCRIPTION: Places a black line segment connecting (246, 200) to (187, 236).
; PLAN: r0=246(x1), r1=200(y1), r2=187(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 200
LDI r2, 187
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
