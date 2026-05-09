; DESCRIPTION: Draws a blue line from (239, 137) to (214, 111).
; PLAN: r0=239(x1), r1=137(y1), r2=214(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 137
LDI r2, 214
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
