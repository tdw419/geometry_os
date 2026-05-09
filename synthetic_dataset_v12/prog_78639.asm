; DESCRIPTION: Places a yellow line segment connecting (492, 210) to (220, 23).
; PLAN: r0=492(x1), r1=210(y1), r2=220(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 210
LDI r2, 220
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
