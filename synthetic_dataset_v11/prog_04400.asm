; DESCRIPTION: Renders a green line between points (175, 80) and (184, 166).
; PLAN: r0=175(x1), r1=80(y1), r2=184(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 80
LDI r2, 184
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
