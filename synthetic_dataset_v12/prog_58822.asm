; DESCRIPTION: Draws a green line from (455, 77) to (300, 5).
; PLAN: r0=455(x1), r1=77(y1), r2=300(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 77
LDI r2, 300
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
