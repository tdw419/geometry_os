; DESCRIPTION: Renders a orange line between points (181, 92) and (173, 190).
; PLAN: r0=181(x1), r1=92(y1), r2=173(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 92
LDI r2, 173
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
