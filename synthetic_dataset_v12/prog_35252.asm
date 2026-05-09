; DESCRIPTION: Places a red line segment connecting (284, 104) to (382, 61).
; PLAN: r0=284(x1), r1=104(y1), r2=382(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 104
LDI r2, 382
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
