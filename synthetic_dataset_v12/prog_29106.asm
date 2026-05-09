; DESCRIPTION: Places a green line segment connecting (79, 130) to (138, 141).
; PLAN: r0=79(x1), r1=130(y1), r2=138(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 130
LDI r2, 138
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
