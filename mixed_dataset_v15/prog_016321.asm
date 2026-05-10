; DESCRIPTION: Draws a green line from (185, 152) to (30, 13).
; PLAN: r0=185(x1), r1=152(y1), r2=30(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 152
LDI r2, 30
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
