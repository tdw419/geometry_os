; DESCRIPTION: Places a cyan line segment connecting (171, 24) to (207, 47).
; PLAN: r0=171(x1), r1=24(y1), r2=207(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 24
LDI r2, 207
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
