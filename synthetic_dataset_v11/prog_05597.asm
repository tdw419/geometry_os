; DESCRIPTION: Places a orange line segment connecting (173, 202) to (236, 229).
; PLAN: r0=173(x1), r1=202(y1), r2=236(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 202
LDI r2, 236
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
