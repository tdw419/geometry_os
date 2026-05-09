; DESCRIPTION: Renders a red line between points (319, 93) and (178, 164).
; PLAN: r0=319(x1), r1=93(y1), r2=178(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 93
LDI r2, 178
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
