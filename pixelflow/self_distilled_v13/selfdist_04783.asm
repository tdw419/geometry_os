; DESCRIPTION: Renders a red line segment connecting (360, 195) to (392, 153).
; PLAN: r0=360(x1), r1=195(y1), r2=392(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 195
LDI r2, 392
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
