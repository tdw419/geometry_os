; DESCRIPTION: Places a green line segment connecting (152, 223) to (393, 3).
; PLAN: r0=152(x1), r1=223(y1), r2=393(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 223
LDI r2, 393
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
