; DESCRIPTION: Places a white line segment connecting (506, 143) to (408, 146).
; PLAN: r0=506(x1), r1=143(y1), r2=408(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 143
LDI r2, 408
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
