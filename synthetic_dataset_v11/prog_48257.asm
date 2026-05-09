; DESCRIPTION: Draws a red line from (148, 209) to (144, 197).
; PLAN: r0=148(x1), r1=209(y1), r2=144(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 209
LDI r2, 144
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
