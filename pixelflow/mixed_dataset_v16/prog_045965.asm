; DESCRIPTION: Draws a purple line from (174, 194) to (295, 85).
; PLAN: r0=174(x1), r1=194(y1), r2=295(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 194
LDI r2, 295
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
