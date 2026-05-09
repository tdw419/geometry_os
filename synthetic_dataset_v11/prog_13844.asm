; DESCRIPTION: Renders a white line between points (134, 205) and (74, 190).
; PLAN: r0=134(x1), r1=205(y1), r2=74(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 205
LDI r2, 74
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
