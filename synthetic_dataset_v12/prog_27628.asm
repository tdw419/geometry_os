; DESCRIPTION: Places a red line segment connecting (332, 189) to (50, 195).
; PLAN: r0=332(x1), r1=189(y1), r2=50(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 189
LDI r2, 50
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
