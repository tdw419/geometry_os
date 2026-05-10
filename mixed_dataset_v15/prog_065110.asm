; DESCRIPTION: Places a red line segment connecting (367, 168) to (188, 255).
; PLAN: r0=367(x1), r1=168(y1), r2=188(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 168
LDI r2, 188
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
