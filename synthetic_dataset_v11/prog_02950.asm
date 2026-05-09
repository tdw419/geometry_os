; DESCRIPTION: Places a cyan line segment connecting (60, 46) to (128, 100).
; PLAN: r0=60(x1), r1=46(y1), r2=128(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 46
LDI r2, 128
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
