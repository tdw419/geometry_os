; DESCRIPTION: Renders a blue line between points (402, 81) and (284, 28).
; PLAN: r0=402(x1), r1=81(y1), r2=284(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 81
LDI r2, 284
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
