; DESCRIPTION: Places a cyan line segment connecting (229, 123) to (254, 208).
; PLAN: r0=229(x1), r1=123(y1), r2=254(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 123
LDI r2, 254
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
