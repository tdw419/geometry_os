; DESCRIPTION: Places a green line segment connecting (290, 33) to (172, 210).
; PLAN: r0=290(x1), r1=33(y1), r2=172(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 33
LDI r2, 172
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
