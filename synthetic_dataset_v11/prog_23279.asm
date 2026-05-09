; DESCRIPTION: Places a green line segment connecting (224, 220) to (176, 246).
; PLAN: r0=224(x1), r1=220(y1), r2=176(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 220
LDI r2, 176
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
