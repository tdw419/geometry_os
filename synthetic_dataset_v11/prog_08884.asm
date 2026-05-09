; DESCRIPTION: Draws a white line from (249, 16) to (112, 190).
; PLAN: r0=249(x1), r1=16(y1), r2=112(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 16
LDI r2, 112
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
