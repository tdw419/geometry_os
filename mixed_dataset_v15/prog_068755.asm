; DESCRIPTION: Places a white line segment connecting (2, 163) to (202, 223).
; PLAN: r0=2(x1), r1=163(y1), r2=202(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 163
LDI r2, 202
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
