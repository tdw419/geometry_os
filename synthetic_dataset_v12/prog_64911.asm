; DESCRIPTION: Renders a green line between points (5, 3) and (481, 206).
; PLAN: r0=5(x1), r1=3(y1), r2=481(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 3
LDI r2, 481
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
