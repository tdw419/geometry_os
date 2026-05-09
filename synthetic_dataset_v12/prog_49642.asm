; DESCRIPTION: Renders a purple line between points (248, 173) and (199, 190).
; PLAN: r0=248(x1), r1=173(y1), r2=199(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 173
LDI r2, 199
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
