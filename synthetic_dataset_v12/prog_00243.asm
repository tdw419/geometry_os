; DESCRIPTION: Renders a red line between points (247, 168) and (440, 177).
; PLAN: r0=247(x1), r1=168(y1), r2=440(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 168
LDI r2, 440
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
