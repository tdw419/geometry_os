; DESCRIPTION: Places a white line segment connecting (65, 213) to (350, 25).
; PLAN: r0=65(x1), r1=213(y1), r2=350(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 213
LDI r2, 350
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
