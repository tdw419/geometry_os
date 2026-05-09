; DESCRIPTION: Places a black line segment connecting (150, 209) to (66, 139).
; PLAN: r0=150(x1), r1=209(y1), r2=66(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 209
LDI r2, 66
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
