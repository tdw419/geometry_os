; DESCRIPTION: Places a white line segment connecting (243, 40) to (3, 226).
; PLAN: r0=243(x1), r1=40(y1), r2=3(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 40
LDI r2, 3
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
