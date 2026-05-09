; DESCRIPTION: Renders a red line between points (64, 22) and (103, 177).
; PLAN: r0=64(x1), r1=22(y1), r2=103(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 22
LDI r2, 103
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
