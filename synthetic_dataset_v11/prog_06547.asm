; DESCRIPTION: Renders a black line between points (105, 190) and (168, 117).
; PLAN: r0=105(x1), r1=190(y1), r2=168(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 190
LDI r2, 168
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
