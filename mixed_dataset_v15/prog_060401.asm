; DESCRIPTION: Draws a white line from (90, 212) to (410, 163).
; PLAN: r0=90(x1), r1=212(y1), r2=410(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 212
LDI r2, 410
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
