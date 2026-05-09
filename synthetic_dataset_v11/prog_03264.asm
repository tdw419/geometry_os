; DESCRIPTION: Places a red line segment connecting (145, 17) to (27, 134).
; PLAN: r0=145(x1), r1=17(y1), r2=27(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 17
LDI r2, 27
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
