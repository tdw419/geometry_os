; DESCRIPTION: Renders a cyan line between points (482, 2) and (314, 29).
; PLAN: r0=482(x1), r1=2(y1), r2=314(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 2
LDI r2, 314
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
