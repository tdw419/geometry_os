; DESCRIPTION: Draws a red line from (473, 47) to (386, 225).
; PLAN: r0=473(x1), r1=47(y1), r2=386(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 47
LDI r2, 386
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
