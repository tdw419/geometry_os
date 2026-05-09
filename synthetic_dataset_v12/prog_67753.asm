; DESCRIPTION: Renders a red line between points (356, 103) and (247, 93).
; PLAN: r0=356(x1), r1=103(y1), r2=247(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 103
LDI r2, 247
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
