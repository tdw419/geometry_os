; DESCRIPTION: Renders a yellow line between points (5, 39) and (92, 177).
; PLAN: r0=5(x1), r1=39(y1), r2=92(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 39
LDI r2, 92
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
