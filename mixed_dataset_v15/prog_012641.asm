; DESCRIPTION: Renders a purple line between points (410, 203) and (171, 179).
; PLAN: r0=410(x1), r1=203(y1), r2=171(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 203
LDI r2, 171
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
