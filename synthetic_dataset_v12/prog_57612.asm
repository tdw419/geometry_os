; DESCRIPTION: Places a green line segment connecting (498, 220) to (222, 57).
; PLAN: r0=498(x1), r1=220(y1), r2=222(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 220
LDI r2, 222
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
