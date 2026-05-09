; DESCRIPTION: Renders a white line between points (115, 141) and (295, 212).
; PLAN: r0=115(x1), r1=141(y1), r2=295(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 141
LDI r2, 295
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
