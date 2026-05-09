; DESCRIPTION: Renders a white line between points (106, 87) and (383, 187).
; PLAN: r0=106(x1), r1=87(y1), r2=383(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 87
LDI r2, 383
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
