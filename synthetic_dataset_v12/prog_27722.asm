; DESCRIPTION: Renders a black line between points (366, 212) and (276, 228).
; PLAN: r0=366(x1), r1=212(y1), r2=276(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 212
LDI r2, 276
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
