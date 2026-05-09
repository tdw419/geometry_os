; DESCRIPTION: Places a white line segment connecting (367, 79) to (450, 65).
; PLAN: r0=367(x1), r1=79(y1), r2=450(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 79
LDI r2, 450
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
