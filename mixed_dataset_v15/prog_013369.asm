; DESCRIPTION: Draws a yellow line from (280, 157) to (413, 65).
; PLAN: r0=280(x1), r1=157(y1), r2=413(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 157
LDI r2, 413
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
