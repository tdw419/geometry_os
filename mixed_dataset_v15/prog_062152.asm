; DESCRIPTION: Draws a green line from (224, 151) to (452, 39).
; PLAN: r0=224(x1), r1=151(y1), r2=452(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 151
LDI r2, 452
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
