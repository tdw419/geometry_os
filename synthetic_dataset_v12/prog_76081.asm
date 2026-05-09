; DESCRIPTION: Places a cyan line segment connecting (177, 121) to (260, 153).
; PLAN: r0=177(x1), r1=121(y1), r2=260(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 121
LDI r2, 260
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
