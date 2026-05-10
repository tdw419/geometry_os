; DESCRIPTION: Places a white line segment connecting (412, 83) to (292, 111).
; PLAN: r0=412(x1), r1=83(y1), r2=292(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 83
LDI r2, 292
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
