; DESCRIPTION: Places a white line segment connecting (61, 146) to (143, 225).
; PLAN: r0=61(x1), r1=146(y1), r2=143(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 146
LDI r2, 143
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
