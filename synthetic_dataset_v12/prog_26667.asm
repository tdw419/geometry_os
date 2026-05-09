; DESCRIPTION: Places a cyan line segment connecting (58, 141) to (44, 57).
; PLAN: r0=58(x1), r1=141(y1), r2=44(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 141
LDI r2, 44
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
