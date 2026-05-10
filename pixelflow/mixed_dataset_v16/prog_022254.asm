; DESCRIPTION: Draws a red line from (385, 125) to (242, 140).
; PLAN: r0=385(x1), r1=125(y1), r2=242(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 125
LDI r2, 242
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
