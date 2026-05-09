; DESCRIPTION: Places a green line segment connecting (46, 167) to (80, 210).
; PLAN: r0=46(x1), r1=167(y1), r2=80(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 167
LDI r2, 80
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
