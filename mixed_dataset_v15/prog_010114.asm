; DESCRIPTION: Draws a red line from (410, 205) to (368, 2).
; PLAN: r0=410(x1), r1=205(y1), r2=368(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 205
LDI r2, 368
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
