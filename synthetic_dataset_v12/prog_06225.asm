; DESCRIPTION: Places a purple line segment connecting (465, 108) to (113, 86).
; PLAN: r0=465(x1), r1=108(y1), r2=113(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 108
LDI r2, 113
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
