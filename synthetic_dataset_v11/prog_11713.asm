; DESCRIPTION: Places a red line segment connecting (174, 146) to (170, 174).
; PLAN: r0=174(x1), r1=146(y1), r2=170(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 146
LDI r2, 170
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
