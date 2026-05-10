; DESCRIPTION: Renders a purple line between points (295, 60) and (465, 13).
; PLAN: r0=295(x1), r1=60(y1), r2=465(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 60
LDI r2, 465
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
