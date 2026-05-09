; DESCRIPTION: Places a cyan line segment connecting (17, 142) to (42, 118).
; PLAN: r0=17(x1), r1=142(y1), r2=42(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 142
LDI r2, 42
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
