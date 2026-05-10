; DESCRIPTION: Places a black line segment connecting (510, 209) to (278, 36).
; PLAN: r0=510(x1), r1=209(y1), r2=278(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 209
LDI r2, 278
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
