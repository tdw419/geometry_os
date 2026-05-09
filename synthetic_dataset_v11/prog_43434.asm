; DESCRIPTION: Renders a red line between points (168, 171) and (103, 47).
; PLAN: r0=168(x1), r1=171(y1), r2=103(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 171
LDI r2, 103
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
