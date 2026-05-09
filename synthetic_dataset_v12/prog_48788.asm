; DESCRIPTION: Draws a green line from (474, 199) to (14, 209).
; PLAN: r0=474(x1), r1=199(y1), r2=14(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 199
LDI r2, 14
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
