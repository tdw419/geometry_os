; DESCRIPTION: Renders a white line between points (314, 42) and (353, 240).
; PLAN: r0=314(x1), r1=42(y1), r2=353(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 42
LDI r2, 353
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
