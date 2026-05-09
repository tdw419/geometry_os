; DESCRIPTION: Places a magenta line segment connecting (239, 225) to (90, 111).
; PLAN: r0=239(x1), r1=225(y1), r2=90(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 225
LDI r2, 90
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
