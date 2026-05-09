; DESCRIPTION: Renders a green line between points (313, 244) and (92, 71).
; PLAN: r0=313(x1), r1=244(y1), r2=92(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 244
LDI r2, 92
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
