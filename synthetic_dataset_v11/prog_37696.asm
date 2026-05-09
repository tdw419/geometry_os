; DESCRIPTION: Draws a green line from (240, 17) to (60, 202).
; PLAN: r0=240(x1), r1=17(y1), r2=60(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 17
LDI r2, 60
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
