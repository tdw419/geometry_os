; DESCRIPTION: Renders a green line between points (8, 103) and (482, 135).
; PLAN: r0=8(x1), r1=103(y1), r2=482(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 103
LDI r2, 482
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
