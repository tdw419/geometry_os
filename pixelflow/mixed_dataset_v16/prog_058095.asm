; DESCRIPTION: Places a white line segment connecting (48, 211) to (17, 57).
; PLAN: r0=48(x1), r1=211(y1), r2=17(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 211
LDI r2, 17
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
