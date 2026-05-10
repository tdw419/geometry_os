; DESCRIPTION: Renders a cyan line segment connecting (240, 87) to (85, 92).
; PLAN: r0=240(x1), r1=87(y1), r2=85(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 87
LDI r2, 85
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
