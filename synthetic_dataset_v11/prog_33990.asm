; DESCRIPTION: Draws a yellow line from (76, 209) to (157, 12).
; PLAN: r0=76(x1), r1=209(y1), r2=157(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 209
LDI r2, 157
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
