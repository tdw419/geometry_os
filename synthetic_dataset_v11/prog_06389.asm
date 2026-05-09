; DESCRIPTION: Places a cyan line segment connecting (177, 82) to (118, 26).
; PLAN: r0=177(x1), r1=82(y1), r2=118(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 82
LDI r2, 118
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
