; DESCRIPTION: Renders a red line between points (280, 98) and (11, 220).
; PLAN: r0=280(x1), r1=98(y1), r2=11(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 98
LDI r2, 11
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
