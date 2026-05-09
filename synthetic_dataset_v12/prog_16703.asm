; DESCRIPTION: Places a purple line segment connecting (446, 79) to (502, 212).
; PLAN: r0=446(x1), r1=79(y1), r2=502(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 79
LDI r2, 502
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
