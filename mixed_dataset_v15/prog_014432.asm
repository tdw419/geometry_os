; DESCRIPTION: Renders a black line between points (448, 173) and (113, 190).
; PLAN: r0=448(x1), r1=173(y1), r2=113(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 173
LDI r2, 113
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
