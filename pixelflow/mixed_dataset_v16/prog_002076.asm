; DESCRIPTION: Renders a red line between points (400, 130) and (231, 44).
; PLAN: r0=400(x1), r1=130(y1), r2=231(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 130
LDI r2, 231
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
