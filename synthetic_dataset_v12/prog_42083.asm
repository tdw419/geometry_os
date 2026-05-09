; DESCRIPTION: Draws a green line from (65, 143) to (209, 160).
; PLAN: r0=65(x1), r1=143(y1), r2=209(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 143
LDI r2, 209
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
