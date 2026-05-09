; DESCRIPTION: Draws a green line from (20, 143) to (142, 60).
; PLAN: r0=20(x1), r1=143(y1), r2=142(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 143
LDI r2, 142
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
