; DESCRIPTION: Renders a white line between points (394, 69) and (388, 22).
; PLAN: r0=394(x1), r1=69(y1), r2=388(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 69
LDI r2, 388
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
