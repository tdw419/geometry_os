; DESCRIPTION: Places a cyan line segment connecting (174, 3) to (205, 229).
; PLAN: r0=174(x1), r1=3(y1), r2=205(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 3
LDI r2, 205
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
