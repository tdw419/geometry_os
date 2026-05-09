; DESCRIPTION: Places a cyan line segment connecting (171, 100) to (99, 140).
; PLAN: r0=171(x1), r1=100(y1), r2=99(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 100
LDI r2, 99
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
