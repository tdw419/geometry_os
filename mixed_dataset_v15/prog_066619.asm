; DESCRIPTION: Renders a white line between points (420, 233) and (508, 187).
; PLAN: r0=420(x1), r1=233(y1), r2=508(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 233
LDI r2, 508
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
