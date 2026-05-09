; DESCRIPTION: Draws a blue line from (446, 182) to (38, 156).
; PLAN: r0=446(x1), r1=182(y1), r2=38(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 182
LDI r2, 38
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
