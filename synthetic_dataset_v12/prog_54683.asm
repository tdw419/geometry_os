; DESCRIPTION: Places a cyan line segment connecting (495, 160) to (384, 93).
; PLAN: r0=495(x1), r1=160(y1), r2=384(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 160
LDI r2, 384
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
