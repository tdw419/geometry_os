; DESCRIPTION: Renders a white line between points (416, 202) and (388, 44).
; PLAN: r0=416(x1), r1=202(y1), r2=388(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 202
LDI r2, 388
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
