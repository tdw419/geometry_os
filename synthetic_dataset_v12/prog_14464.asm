; DESCRIPTION: Renders a purple line between points (86, 164) and (284, 4).
; PLAN: r0=86(x1), r1=164(y1), r2=284(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 164
LDI r2, 284
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
