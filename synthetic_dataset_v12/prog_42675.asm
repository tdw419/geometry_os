; DESCRIPTION: Renders a white line between points (428, 0) and (493, 162).
; PLAN: r0=428(x1), r1=0(y1), r2=493(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 0
LDI r2, 493
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
