; DESCRIPTION: Renders a red line between points (480, 29) and (172, 197).
; PLAN: r0=480(x1), r1=29(y1), r2=172(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 29
LDI r2, 172
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
