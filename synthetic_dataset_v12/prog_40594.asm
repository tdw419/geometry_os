; DESCRIPTION: Renders a yellow line between points (121, 12) and (509, 166).
; PLAN: r0=121(x1), r1=12(y1), r2=509(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 12
LDI r2, 509
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
