; DESCRIPTION: Places a black line segment connecting (220, 249) to (5, 166).
; PLAN: r0=220(x1), r1=249(y1), r2=5(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 249
LDI r2, 5
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
