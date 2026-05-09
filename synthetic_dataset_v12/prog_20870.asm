; DESCRIPTION: Renders a white line between points (293, 241) and (405, 23).
; PLAN: r0=293(x1), r1=241(y1), r2=405(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 241
LDI r2, 405
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
