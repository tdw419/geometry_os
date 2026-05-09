; DESCRIPTION: Places a yellow line segment connecting (487, 206) to (472, 111).
; PLAN: r0=487(x1), r1=206(y1), r2=472(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 206
LDI r2, 472
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
