; DESCRIPTION: Places a white line segment connecting (45, 222) to (171, 202).
; PLAN: r0=45(x1), r1=222(y1), r2=171(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 222
LDI r2, 171
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
