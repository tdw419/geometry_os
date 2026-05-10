; DESCRIPTION: Renders a white line segment connecting (108, 38) to (259, 171).
; PLAN: r0=108(x1), r1=38(y1), r2=259(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 38
LDI r2, 259
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
