; DESCRIPTION: Places a green line segment connecting (33, 149) to (46, 193).
; PLAN: r0=33(x1), r1=149(y1), r2=46(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 149
LDI r2, 46
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
