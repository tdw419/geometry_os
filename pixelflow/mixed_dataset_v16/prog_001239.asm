; DESCRIPTION: Renders a red line between points (39, 72) and (115, 171).
; PLAN: r0=39(x1), r1=72(y1), r2=115(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 72
LDI r2, 115
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
