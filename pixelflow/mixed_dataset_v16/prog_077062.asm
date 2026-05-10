; DESCRIPTION: Places a cyan line segment connecting (335, 255) to (450, 163).
; PLAN: r0=335(x1), r1=255(y1), r2=450(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 255
LDI r2, 450
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
