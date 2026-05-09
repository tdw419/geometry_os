; DESCRIPTION: Places a red line segment connecting (146, 116) to (469, 47).
; PLAN: r0=146(x1), r1=116(y1), r2=469(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 116
LDI r2, 469
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
