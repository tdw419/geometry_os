; DESCRIPTION: Draws a red line from (98, 242) to (206, 105).
; PLAN: r0=98(x1), r1=242(y1), r2=206(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 242
LDI r2, 206
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
