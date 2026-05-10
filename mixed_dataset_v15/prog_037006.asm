; DESCRIPTION: Renders a magenta line between points (284, 0) and (435, 104).
; PLAN: r0=284(x1), r1=0(y1), r2=435(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 0
LDI r2, 435
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
