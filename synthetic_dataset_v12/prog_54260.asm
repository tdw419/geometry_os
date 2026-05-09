; DESCRIPTION: Places a green line segment connecting (107, 144) to (309, 150).
; PLAN: r0=107(x1), r1=144(y1), r2=309(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 144
LDI r2, 309
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
