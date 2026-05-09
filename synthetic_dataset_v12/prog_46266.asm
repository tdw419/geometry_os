; DESCRIPTION: Places a magenta line segment connecting (474, 239) to (501, 111).
; PLAN: r0=474(x1), r1=239(y1), r2=501(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 239
LDI r2, 501
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
