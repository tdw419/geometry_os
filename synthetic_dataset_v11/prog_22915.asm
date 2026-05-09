; DESCRIPTION: Renders a red line between points (203, 98) and (3, 117).
; PLAN: r0=203(x1), r1=98(y1), r2=3(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 98
LDI r2, 3
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
