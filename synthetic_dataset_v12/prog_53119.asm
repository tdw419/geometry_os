; DESCRIPTION: Places a red line segment connecting (336, 74) to (284, 44).
; PLAN: r0=336(x1), r1=74(y1), r2=284(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 74
LDI r2, 284
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
