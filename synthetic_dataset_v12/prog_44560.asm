; DESCRIPTION: Renders a purple line between points (439, 247) and (504, 113).
; PLAN: r0=439(x1), r1=247(y1), r2=504(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 247
LDI r2, 504
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
