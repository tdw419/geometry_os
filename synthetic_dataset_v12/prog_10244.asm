; DESCRIPTION: Places a cyan line segment connecting (169, 147) to (29, 42).
; PLAN: r0=169(x1), r1=147(y1), r2=29(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 147
LDI r2, 29
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
