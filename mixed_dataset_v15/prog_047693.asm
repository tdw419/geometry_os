; DESCRIPTION: Renders a red line between points (481, 16) and (92, 180).
; PLAN: r0=481(x1), r1=16(y1), r2=92(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 16
LDI r2, 92
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
