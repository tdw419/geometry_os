; DESCRIPTION: Draws a white line from (221, 93) to (131, 144).
; PLAN: r0=221(x1), r1=93(y1), r2=131(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 93
LDI r2, 131
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
