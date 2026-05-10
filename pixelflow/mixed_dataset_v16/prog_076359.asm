; DESCRIPTION: Places a cyan line segment connecting (159, 28) to (86, 64).
; PLAN: r0=159(x1), r1=28(y1), r2=86(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 28
LDI r2, 86
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
