; DESCRIPTION: Renders a black line between points (260, 221) and (321, 111).
; PLAN: r0=260(x1), r1=221(y1), r2=321(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 221
LDI r2, 321
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
