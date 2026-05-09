; DESCRIPTION: Places a cyan line segment connecting (147, 177) to (42, 172).
; PLAN: r0=147(x1), r1=177(y1), r2=42(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 177
LDI r2, 42
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
