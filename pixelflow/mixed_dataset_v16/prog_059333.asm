; DESCRIPTION: Places a yellow line segment connecting (470, 209) to (481, 221).
; PLAN: r0=470(x1), r1=209(y1), r2=481(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 209
LDI r2, 481
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
