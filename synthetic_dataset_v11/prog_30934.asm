; DESCRIPTION: Places a cyan line segment connecting (115, 255) to (53, 101).
; PLAN: r0=115(x1), r1=255(y1), r2=53(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 255
LDI r2, 53
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
