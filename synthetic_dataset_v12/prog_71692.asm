; DESCRIPTION: Places a black line segment connecting (118, 152) to (209, 249).
; PLAN: r0=118(x1), r1=152(y1), r2=209(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 152
LDI r2, 209
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
