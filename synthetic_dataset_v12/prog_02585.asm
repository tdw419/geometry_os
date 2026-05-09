; DESCRIPTION: Places a green line segment connecting (503, 82) to (296, 224).
; PLAN: r0=503(x1), r1=82(y1), r2=296(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 82
LDI r2, 296
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
