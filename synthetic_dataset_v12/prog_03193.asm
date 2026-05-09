; DESCRIPTION: Renders a purple line between points (284, 141) and (123, 80).
; PLAN: r0=284(x1), r1=141(y1), r2=123(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 141
LDI r2, 123
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
