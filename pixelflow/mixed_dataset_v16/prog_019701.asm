; DESCRIPTION: Draws a red line from (53, 205) to (236, 86).
; PLAN: r0=53(x1), r1=205(y1), r2=236(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 205
LDI r2, 236
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
