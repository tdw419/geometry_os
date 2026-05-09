; DESCRIPTION: Places a magenta line segment connecting (171, 47) to (430, 0).
; PLAN: r0=171(x1), r1=47(y1), r2=430(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 47
LDI r2, 430
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
