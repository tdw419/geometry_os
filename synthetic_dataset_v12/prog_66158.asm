; DESCRIPTION: Places a cyan line segment connecting (414, 94) to (171, 134).
; PLAN: r0=414(x1), r1=94(y1), r2=171(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 94
LDI r2, 171
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
