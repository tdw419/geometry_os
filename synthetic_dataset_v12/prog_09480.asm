; DESCRIPTION: Renders a yellow line between points (60, 215) and (190, 117).
; PLAN: r0=60(x1), r1=215(y1), r2=190(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 215
LDI r2, 190
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
