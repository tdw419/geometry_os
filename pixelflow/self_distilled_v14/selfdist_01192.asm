; DESCRIPTION: Renders a cyan line segment connecting (147, 15) to (243, 121).
; PLAN: r0=147(x1), r1=15(y1), r2=243(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 15
LDI r2, 243
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
