; DESCRIPTION: Places a cyan line segment connecting (124, 12) to (174, 229).
; PLAN: r0=124(x1), r1=12(y1), r2=174(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 12
LDI r2, 174
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
