; DESCRIPTION: Places a cyan line segment connecting (237, 62) to (174, 187).
; PLAN: r0=237(x1), r1=62(y1), r2=174(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 62
LDI r2, 174
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
