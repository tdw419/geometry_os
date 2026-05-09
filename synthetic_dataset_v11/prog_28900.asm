; DESCRIPTION: Draws a red line from (198, 86) to (65, 87).
; PLAN: r0=198(x1), r1=86(y1), r2=65(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 86
LDI r2, 65
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
