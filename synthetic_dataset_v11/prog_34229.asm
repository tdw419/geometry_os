; DESCRIPTION: Draws a yellow line from (180, 61) to (182, 170).
; PLAN: r0=180(x1), r1=61(y1), r2=182(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 61
LDI r2, 182
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
