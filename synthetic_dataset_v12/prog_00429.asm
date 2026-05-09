; DESCRIPTION: Renders a purple line between points (458, 27) and (420, 207).
; PLAN: r0=458(x1), r1=27(y1), r2=420(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 27
LDI r2, 420
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
