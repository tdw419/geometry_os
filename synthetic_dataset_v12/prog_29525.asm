; DESCRIPTION: Renders a white line between points (163, 142) and (410, 163).
; PLAN: r0=163(x1), r1=142(y1), r2=410(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 142
LDI r2, 410
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
