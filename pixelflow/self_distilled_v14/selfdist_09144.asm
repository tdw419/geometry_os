; DESCRIPTION: Draws a red line from (313, 83) to (236, 16).
; PLAN: r0=313(x1), r1=83(y1), r2=236(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 83
LDI r2, 236
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
