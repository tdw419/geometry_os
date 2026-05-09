; DESCRIPTION: Places a green line segment connecting (436, 147) to (328, 64).
; PLAN: r0=436(x1), r1=147(y1), r2=328(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 147
LDI r2, 328
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
