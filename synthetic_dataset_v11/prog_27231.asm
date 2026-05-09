; DESCRIPTION: Renders a green line between points (171, 93) and (35, 82).
; PLAN: r0=171(x1), r1=93(y1), r2=35(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 93
LDI r2, 35
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
