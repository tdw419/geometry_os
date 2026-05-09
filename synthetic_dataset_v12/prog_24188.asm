; DESCRIPTION: Renders a green line between points (263, 226) and (416, 111).
; PLAN: r0=263(x1), r1=226(y1), r2=416(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 226
LDI r2, 416
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
