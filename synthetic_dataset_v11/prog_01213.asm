; DESCRIPTION: Places a green line segment connecting (152, 235) to (78, 237).
; PLAN: r0=152(x1), r1=235(y1), r2=78(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 235
LDI r2, 78
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
