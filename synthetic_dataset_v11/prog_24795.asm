; DESCRIPTION: Places a cyan line segment connecting (83, 48) to (8, 135).
; PLAN: r0=83(x1), r1=48(y1), r2=8(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 48
LDI r2, 8
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
