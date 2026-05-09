; DESCRIPTION: Draws a red line from (491, 213) to (54, 237).
; PLAN: r0=491(x1), r1=213(y1), r2=54(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 213
LDI r2, 54
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
