; DESCRIPTION: Places a red line segment connecting (176, 17) to (156, 146).
; PLAN: r0=176(x1), r1=17(y1), r2=156(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 17
LDI r2, 156
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
