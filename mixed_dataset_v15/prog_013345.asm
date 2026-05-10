; DESCRIPTION: Draws a green line from (299, 80) to (469, 64).
; PLAN: r0=299(x1), r1=80(y1), r2=469(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 80
LDI r2, 469
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
