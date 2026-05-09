; DESCRIPTION: Places a cyan line segment connecting (43, 67) to (199, 44).
; PLAN: r0=43(x1), r1=67(y1), r2=199(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 67
LDI r2, 199
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
