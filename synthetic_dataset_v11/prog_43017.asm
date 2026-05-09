; DESCRIPTION: Places a cyan line segment connecting (24, 82) to (25, 118).
; PLAN: r0=24(x1), r1=82(y1), r2=25(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 82
LDI r2, 25
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
