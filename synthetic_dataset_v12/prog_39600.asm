; DESCRIPTION: Places a white line segment connecting (284, 4) to (377, 56).
; PLAN: r0=284(x1), r1=4(y1), r2=377(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 4
LDI r2, 377
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
