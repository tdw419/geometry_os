; DESCRIPTION: Renders a yellow line between points (56, 126) and (249, 255).
; PLAN: r0=56(x1), r1=126(y1), r2=249(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 126
LDI r2, 249
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
