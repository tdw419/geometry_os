; DESCRIPTION: Renders a red line segment connecting (335, 108) to (292, 117).
; PLAN: r0=335(x1), r1=108(y1), r2=292(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 108
LDI r2, 292
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
