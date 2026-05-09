; DESCRIPTION: Renders a yellow line between points (228, 2) and (243, 80).
; PLAN: r0=228(x1), r1=2(y1), r2=243(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 2
LDI r2, 243
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
