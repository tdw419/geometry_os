; DESCRIPTION: Renders a green line between points (9, 121) and (504, 92).
; PLAN: r0=9(x1), r1=121(y1), r2=504(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 121
LDI r2, 504
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
