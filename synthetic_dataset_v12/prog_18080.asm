; DESCRIPTION: Places a yellow line segment connecting (164, 152) to (305, 46).
; PLAN: r0=164(x1), r1=152(y1), r2=305(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 152
LDI r2, 305
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
