; DESCRIPTION: Places a black line segment connecting (108, 209) to (82, 157).
; PLAN: r0=108(x1), r1=209(y1), r2=82(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 209
LDI r2, 82
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
