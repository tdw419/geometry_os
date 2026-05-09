; DESCRIPTION: Places a white line segment connecting (319, 168) to (63, 175).
; PLAN: r0=319(x1), r1=168(y1), r2=63(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 168
LDI r2, 63
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
