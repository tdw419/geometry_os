; DESCRIPTION: Draws a green line from (225, 36) to (484, 209).
; PLAN: r0=225(x1), r1=36(y1), r2=484(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 36
LDI r2, 484
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
