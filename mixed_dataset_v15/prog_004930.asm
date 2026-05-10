; DESCRIPTION: Places a red line segment connecting (103, 108) to (230, 14).
; PLAN: r0=103(x1), r1=108(y1), r2=230(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 108
LDI r2, 230
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
