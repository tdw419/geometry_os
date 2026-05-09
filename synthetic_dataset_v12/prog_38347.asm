; DESCRIPTION: Draws a black line from (190, 151) to (228, 66).
; PLAN: r0=190(x1), r1=151(y1), r2=228(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 151
LDI r2, 228
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
