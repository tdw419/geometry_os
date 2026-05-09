; DESCRIPTION: Places a red line segment connecting (82, 108) to (175, 214).
; PLAN: r0=82(x1), r1=108(y1), r2=175(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 108
LDI r2, 175
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
