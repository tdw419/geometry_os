; DESCRIPTION: Draws a red line from (279, 83) to (39, 29).
; PLAN: r0=279(x1), r1=83(y1), r2=39(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 83
LDI r2, 39
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
