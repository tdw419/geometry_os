; DESCRIPTION: Draws a green line from (226, 76) to (413, 253).
; PLAN: r0=226(x1), r1=76(y1), r2=413(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 76
LDI r2, 413
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
