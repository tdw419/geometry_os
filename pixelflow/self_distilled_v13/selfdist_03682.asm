; DESCRIPTION: Renders a white line segment connecting (398, 190) to (229, 124).
; PLAN: r0=398(x1), r1=190(y1), r2=229(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 190
LDI r2, 229
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
