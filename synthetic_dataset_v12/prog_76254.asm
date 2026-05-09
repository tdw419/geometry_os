; DESCRIPTION: Renders a blue line between points (415, 2) and (228, 92).
; PLAN: r0=415(x1), r1=2(y1), r2=228(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 2
LDI r2, 228
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
