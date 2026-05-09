; DESCRIPTION: Renders a red line between points (126, 61) and (126, 243).
; PLAN: r0=126(x1), r1=61(y1), r2=126(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 61
LDI r2, 126
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
