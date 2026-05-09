; DESCRIPTION: Draws a red line from (148, 240) to (196, 120).
; PLAN: r0=148(x1), r1=240(y1), r2=196(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 240
LDI r2, 196
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
