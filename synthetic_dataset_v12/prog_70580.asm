; DESCRIPTION: Places a green line segment connecting (510, 36) to (305, 111).
; PLAN: r0=510(x1), r1=36(y1), r2=305(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 36
LDI r2, 305
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
