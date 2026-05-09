; DESCRIPTION: Places a red line segment connecting (456, 209) to (258, 8).
; PLAN: r0=456(x1), r1=209(y1), r2=258(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 209
LDI r2, 258
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
