; DESCRIPTION: Draws a red line from (286, 137) to (386, 253).
; PLAN: r0=286(x1), r1=137(y1), r2=386(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 137
LDI r2, 386
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
