; DESCRIPTION: Places a cyan line segment connecting (460, 229) to (145, 247).
; PLAN: r0=460(x1), r1=229(y1), r2=145(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 229
LDI r2, 145
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
