; DESCRIPTION: Places a magenta line segment connecting (291, 209) to (391, 3).
; PLAN: r0=291(x1), r1=209(y1), r2=391(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 209
LDI r2, 391
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
