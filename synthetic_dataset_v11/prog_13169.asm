; DESCRIPTION: Places a yellow line segment connecting (143, 209) to (72, 21).
; PLAN: r0=143(x1), r1=209(y1), r2=72(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 209
LDI r2, 72
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
