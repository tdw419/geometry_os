; DESCRIPTION: Places a red line segment connecting (469, 36) to (398, 55).
; PLAN: r0=469(x1), r1=36(y1), r2=398(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 36
LDI r2, 398
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
