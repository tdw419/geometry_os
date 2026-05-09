; DESCRIPTION: Places a cyan line segment connecting (255, 18) to (64, 62).
; PLAN: r0=255(x1), r1=18(y1), r2=64(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 18
LDI r2, 64
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
