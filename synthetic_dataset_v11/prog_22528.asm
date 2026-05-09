; DESCRIPTION: Renders a red line between points (178, 196) and (82, 168).
; PLAN: r0=178(x1), r1=196(y1), r2=82(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 196
LDI r2, 82
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
