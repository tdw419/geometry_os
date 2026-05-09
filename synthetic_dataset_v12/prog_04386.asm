; DESCRIPTION: Places a green line segment connecting (509, 208) to (244, 253).
; PLAN: r0=509(x1), r1=208(y1), r2=244(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 208
LDI r2, 244
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
