; DESCRIPTION: Places a red line segment connecting (208, 146) to (504, 76).
; PLAN: r0=208(x1), r1=146(y1), r2=504(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 146
LDI r2, 504
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
