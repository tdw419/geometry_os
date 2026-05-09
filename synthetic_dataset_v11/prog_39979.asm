; DESCRIPTION: Places a green line segment connecting (174, 236) to (4, 152).
; PLAN: r0=174(x1), r1=236(y1), r2=4(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 236
LDI r2, 4
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
