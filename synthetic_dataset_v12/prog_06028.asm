; DESCRIPTION: Places a green line segment connecting (284, 0) to (361, 94).
; PLAN: r0=284(x1), r1=0(y1), r2=361(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 0
LDI r2, 361
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
