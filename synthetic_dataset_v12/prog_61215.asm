; DESCRIPTION: Places a cyan line segment connecting (294, 49) to (156, 187).
; PLAN: r0=294(x1), r1=49(y1), r2=156(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 49
LDI r2, 156
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
