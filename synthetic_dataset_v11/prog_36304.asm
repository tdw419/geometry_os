; DESCRIPTION: Places a cyan line segment connecting (106, 124) to (7, 208).
; PLAN: r0=106(x1), r1=124(y1), r2=7(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 124
LDI r2, 7
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
