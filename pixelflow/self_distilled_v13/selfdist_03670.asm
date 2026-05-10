; DESCRIPTION: Renders a yellow line segment connecting (380, 200) to (218, 111).
; PLAN: r0=380(x1), r1=200(y1), r2=218(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 200
LDI r2, 218
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
