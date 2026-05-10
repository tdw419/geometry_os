; DESCRIPTION: Renders a cyan line segment connecting (383, 1) to (206, 185).
; PLAN: r0=383(x1), r1=1(y1), r2=206(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 1
LDI r2, 206
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
