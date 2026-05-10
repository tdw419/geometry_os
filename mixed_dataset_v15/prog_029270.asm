; DESCRIPTION: Places a white line segment connecting (359, 85) to (410, 241).
; PLAN: r0=359(x1), r1=85(y1), r2=410(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 85
LDI r2, 410
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
