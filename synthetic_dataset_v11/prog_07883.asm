; DESCRIPTION: Places a cyan line segment connecting (64, 44) to (105, 5).
; PLAN: r0=64(x1), r1=44(y1), r2=105(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 44
LDI r2, 105
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
