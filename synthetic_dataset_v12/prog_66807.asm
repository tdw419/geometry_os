; DESCRIPTION: Places a green line segment connecting (321, 202) to (284, 80).
; PLAN: r0=321(x1), r1=202(y1), r2=284(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 202
LDI r2, 284
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
