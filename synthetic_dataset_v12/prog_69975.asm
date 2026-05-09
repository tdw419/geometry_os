; DESCRIPTION: Places a purple line segment connecting (284, 58) to (298, 66).
; PLAN: r0=284(x1), r1=58(y1), r2=298(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 58
LDI r2, 298
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
