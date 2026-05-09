; DESCRIPTION: Places a cyan line segment connecting (177, 241) to (411, 70).
; PLAN: r0=177(x1), r1=241(y1), r2=411(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 241
LDI r2, 411
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
