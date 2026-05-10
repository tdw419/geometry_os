; DESCRIPTION: Draws a red line from (279, 30) to (410, 101).
; PLAN: r0=279(x1), r1=30(y1), r2=410(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 30
LDI r2, 410
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
