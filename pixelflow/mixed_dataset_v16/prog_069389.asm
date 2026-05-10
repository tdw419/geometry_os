; DESCRIPTION: Renders a white line segment connecting (305, 149) to (276, 31).
; PLAN: r0=305(x1), r1=149(y1), r2=276(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 149
LDI r2, 276
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
