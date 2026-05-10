; DESCRIPTION: Renders a yellow line between points (220, 236) and (184, 146).
; PLAN: r0=220(x1), r1=236(y1), r2=184(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 236
LDI r2, 184
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
