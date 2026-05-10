; DESCRIPTION: Places a red line segment connecting (208, 209) to (256, 226).
; PLAN: r0=208(x1), r1=209(y1), r2=256(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 209
LDI r2, 256
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
