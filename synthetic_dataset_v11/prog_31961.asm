; DESCRIPTION: Renders a yellow line between points (5, 108) and (242, 54).
; PLAN: r0=5(x1), r1=108(y1), r2=242(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 108
LDI r2, 242
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
