; DESCRIPTION: Places a red line segment connecting (191, 65) to (337, 146).
; PLAN: r0=191(x1), r1=65(y1), r2=337(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 65
LDI r2, 337
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
