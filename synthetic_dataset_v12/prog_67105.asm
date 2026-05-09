; DESCRIPTION: Places a cyan line segment connecting (109, 146) to (241, 0).
; PLAN: r0=109(x1), r1=146(y1), r2=241(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 146
LDI r2, 241
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
