; DESCRIPTION: Renders a yellow line between points (121, 224) and (429, 209).
; PLAN: r0=121(x1), r1=224(y1), r2=429(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 224
LDI r2, 429
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
