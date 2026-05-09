; DESCRIPTION: Renders a white line between points (218, 67) and (83, 114).
; PLAN: r0=218(x1), r1=67(y1), r2=83(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 67
LDI r2, 83
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
