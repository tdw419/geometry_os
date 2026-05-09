; DESCRIPTION: Places a white line segment connecting (54, 149) to (213, 232).
; PLAN: r0=54(x1), r1=149(y1), r2=213(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 149
LDI r2, 213
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
