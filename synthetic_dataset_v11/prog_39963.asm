; DESCRIPTION: Draws a green line from (111, 224) to (229, 236).
; PLAN: r0=111(x1), r1=224(y1), r2=229(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 224
LDI r2, 229
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
