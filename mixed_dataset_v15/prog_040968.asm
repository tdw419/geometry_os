; DESCRIPTION: Places a white line segment connecting (106, 247) to (383, 146).
; PLAN: r0=106(x1), r1=247(y1), r2=383(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 247
LDI r2, 383
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
