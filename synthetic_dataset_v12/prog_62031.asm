; DESCRIPTION: Renders a red line between points (442, 220) and (28, 39).
; PLAN: r0=442(x1), r1=220(y1), r2=28(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 220
LDI r2, 28
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
