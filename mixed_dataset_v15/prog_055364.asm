; DESCRIPTION: Renders a red line between points (501, 231) and (90, 28).
; PLAN: r0=501(x1), r1=231(y1), r2=90(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 231
LDI r2, 90
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
