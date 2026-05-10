; DESCRIPTION: Renders a red line between points (317, 151) and (98, 255).
; PLAN: r0=317(x1), r1=151(y1), r2=98(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 151
LDI r2, 98
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
