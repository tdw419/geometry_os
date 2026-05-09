; DESCRIPTION: Places a white line segment connecting (56, 151) to (149, 173).
; PLAN: r0=56(x1), r1=151(y1), r2=149(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 151
LDI r2, 149
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
