; DESCRIPTION: Renders a white line between points (417, 21) and (405, 36).
; PLAN: r0=417(x1), r1=21(y1), r2=405(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 21
LDI r2, 405
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
