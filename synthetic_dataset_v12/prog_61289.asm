; DESCRIPTION: Places a white line segment connecting (171, 132) to (7, 135).
; PLAN: r0=171(x1), r1=132(y1), r2=7(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 132
LDI r2, 7
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
