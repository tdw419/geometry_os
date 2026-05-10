; DESCRIPTION: Renders a cyan line segment connecting (340, 59) to (222, 120).
; PLAN: r0=340(x1), r1=59(y1), r2=222(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 59
LDI r2, 222
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
