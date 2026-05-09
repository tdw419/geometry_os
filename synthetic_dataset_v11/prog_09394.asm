; DESCRIPTION: Draws a cyan line from (250, 17) to (145, 253).
; PLAN: r0=250(x1), r1=17(y1), r2=145(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 17
LDI r2, 145
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
