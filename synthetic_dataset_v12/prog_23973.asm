; DESCRIPTION: Draws a red line from (176, 243) to (313, 160).
; PLAN: r0=176(x1), r1=243(y1), r2=313(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 243
LDI r2, 313
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
