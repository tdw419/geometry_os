; DESCRIPTION: Draws a white line from (279, 20) to (470, 162).
; PLAN: r0=279(x1), r1=20(y1), r2=470(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 20
LDI r2, 470
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
