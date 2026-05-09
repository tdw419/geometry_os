; DESCRIPTION: Places a black line segment connecting (229, 194) to (207, 210).
; PLAN: r0=229(x1), r1=194(y1), r2=207(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 194
LDI r2, 207
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
