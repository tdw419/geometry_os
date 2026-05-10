; DESCRIPTION: Places a white line segment connecting (470, 171) to (301, 82).
; PLAN: r0=470(x1), r1=171(y1), r2=301(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 171
LDI r2, 301
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
