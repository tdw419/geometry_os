; DESCRIPTION: Places a red line segment connecting (174, 108) to (156, 240).
; PLAN: r0=174(x1), r1=108(y1), r2=156(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 108
LDI r2, 156
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
