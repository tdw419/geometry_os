; DESCRIPTION: Renders a yellow line between points (333, 154) and (150, 212).
; PLAN: r0=333(x1), r1=154(y1), r2=150(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 154
LDI r2, 150
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
