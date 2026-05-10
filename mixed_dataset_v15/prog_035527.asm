; DESCRIPTION: Places a green line segment connecting (379, 46) to (392, 225).
; PLAN: r0=379(x1), r1=46(y1), r2=392(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 46
LDI r2, 392
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
