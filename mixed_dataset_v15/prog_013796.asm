; DESCRIPTION: Places a red line segment connecting (403, 13) to (37, 57).
; PLAN: r0=403(x1), r1=13(y1), r2=37(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 13
LDI r2, 37
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
