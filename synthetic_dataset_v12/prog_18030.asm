; DESCRIPTION: Places a white line segment connecting (74, 68) to (330, 82).
; PLAN: r0=74(x1), r1=68(y1), r2=330(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 68
LDI r2, 330
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
