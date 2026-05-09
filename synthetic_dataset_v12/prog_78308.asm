; DESCRIPTION: Places a red line segment connecting (340, 245) to (452, 220).
; PLAN: r0=340(x1), r1=245(y1), r2=452(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 245
LDI r2, 452
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
