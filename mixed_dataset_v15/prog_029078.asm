; DESCRIPTION: Renders a cyan line segment connecting (361, 62) to (43, 169).
; PLAN: r0=361(x1), r1=62(y1), r2=43(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 62
LDI r2, 43
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
