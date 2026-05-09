; DESCRIPTION: Renders a purple line between points (433, 46) and (82, 14).
; PLAN: r0=433(x1), r1=46(y1), r2=82(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 46
LDI r2, 82
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
