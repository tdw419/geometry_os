; DESCRIPTION: Draws a orange line from (317, 47) to (406, 225).
; PLAN: r0=317(x1), r1=47(y1), r2=406(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 47
LDI r2, 406
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
