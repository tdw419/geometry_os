; DESCRIPTION: Places a cyan line segment connecting (375, 10) to (16, 13).
; PLAN: r0=375(x1), r1=10(y1), r2=16(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 10
LDI r2, 16
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
