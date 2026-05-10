; DESCRIPTION: Renders a white line between points (165, 115) and (410, 119).
; PLAN: r0=165(x1), r1=115(y1), r2=410(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 115
LDI r2, 410
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
