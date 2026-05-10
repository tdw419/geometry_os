; DESCRIPTION: Renders a green line between points (33, 247) and (101, 111).
; PLAN: r0=33(x1), r1=247(y1), r2=101(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 247
LDI r2, 101
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
