; DESCRIPTION: Places a red line segment connecting (256, 195) to (370, 55).
; PLAN: r0=256(x1), r1=195(y1), r2=370(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 195
LDI r2, 370
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
