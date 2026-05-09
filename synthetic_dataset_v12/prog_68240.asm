; DESCRIPTION: Renders a yellow line between points (27, 176) and (150, 5).
; PLAN: r0=27(x1), r1=176(y1), r2=150(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 176
LDI r2, 150
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
