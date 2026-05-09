; DESCRIPTION: Draws a red line from (237, 98) to (250, 253).
; PLAN: r0=237(x1), r1=98(y1), r2=250(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 98
LDI r2, 250
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
