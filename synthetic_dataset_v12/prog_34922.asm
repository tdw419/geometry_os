; DESCRIPTION: Draws a purple line from (410, 153) to (493, 103).
; PLAN: r0=410(x1), r1=153(y1), r2=493(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 153
LDI r2, 493
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
