; DESCRIPTION: Places a red line segment connecting (189, 214) to (408, 111).
; PLAN: r0=189(x1), r1=214(y1), r2=408(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 214
LDI r2, 408
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
