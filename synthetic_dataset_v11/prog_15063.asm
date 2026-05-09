; DESCRIPTION: Places a cyan line segment connecting (67, 37) to (4, 44).
; PLAN: r0=67(x1), r1=37(y1), r2=4(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 37
LDI r2, 4
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
