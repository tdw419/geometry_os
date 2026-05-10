; DESCRIPTION: Renders a white line segment connecting (334, 59) to (365, 190).
; PLAN: r0=334(x1), r1=59(y1), r2=365(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 59
LDI r2, 365
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
