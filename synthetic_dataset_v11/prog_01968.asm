; DESCRIPTION: Renders a red line between points (206, 99) and (242, 80).
; PLAN: r0=206(x1), r1=99(y1), r2=242(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 99
LDI r2, 242
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
