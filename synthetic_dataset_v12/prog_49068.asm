; DESCRIPTION: Places a white line segment connecting (387, 171) to (332, 156).
; PLAN: r0=387(x1), r1=171(y1), r2=332(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 171
LDI r2, 332
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
