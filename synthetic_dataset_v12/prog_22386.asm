; DESCRIPTION: Renders a purple line between points (330, 204) and (295, 162).
; PLAN: r0=330(x1), r1=204(y1), r2=295(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 204
LDI r2, 295
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
