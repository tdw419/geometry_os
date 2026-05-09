; DESCRIPTION: Renders a blue line between points (211, 206) and (272, 111).
; PLAN: r0=211(x1), r1=206(y1), r2=272(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 206
LDI r2, 272
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
