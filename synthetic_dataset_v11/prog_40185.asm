; DESCRIPTION: Draws a blue line from (77, 228) to (90, 41).
; PLAN: r0=77(x1), r1=228(y1), r2=90(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 228
LDI r2, 90
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
