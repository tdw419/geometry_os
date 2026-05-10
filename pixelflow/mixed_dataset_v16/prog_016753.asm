; DESCRIPTION: Draws a purple line from (48, 59) to (449, 16).
; PLAN: r0=48(x1), r1=59(y1), r2=449(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 59
LDI r2, 449
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
