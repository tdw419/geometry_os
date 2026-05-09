; DESCRIPTION: Renders a purple line between points (154, 35) and (48, 28).
; PLAN: r0=154(x1), r1=35(y1), r2=48(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 35
LDI r2, 48
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
