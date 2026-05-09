; DESCRIPTION: Draws a red line from (305, 129) to (436, 238).
; PLAN: r0=305(x1), r1=129(y1), r2=436(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 129
LDI r2, 436
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
