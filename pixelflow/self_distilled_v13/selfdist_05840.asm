; DESCRIPTION: Renders a cyan line segment connecting (147, 140) to (392, 36).
; PLAN: r0=147(x1), r1=140(y1), r2=392(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 140
LDI r2, 392
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
