; DESCRIPTION: Places a white line segment connecting (275, 93) to (405, 149).
; PLAN: r0=275(x1), r1=93(y1), r2=405(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 93
LDI r2, 405
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
