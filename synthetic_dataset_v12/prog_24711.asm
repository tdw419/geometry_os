; DESCRIPTION: Renders a yellow line between points (90, 248) and (445, 77).
; PLAN: r0=90(x1), r1=248(y1), r2=445(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 248
LDI r2, 445
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
