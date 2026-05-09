; DESCRIPTION: Places a cyan line segment connecting (229, 172) to (63, 252).
; PLAN: r0=229(x1), r1=172(y1), r2=63(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 172
LDI r2, 63
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
