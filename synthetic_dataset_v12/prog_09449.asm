; DESCRIPTION: Draws a yellow line from (220, 127) to (239, 111).
; PLAN: r0=220(x1), r1=127(y1), r2=239(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 127
LDI r2, 239
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
