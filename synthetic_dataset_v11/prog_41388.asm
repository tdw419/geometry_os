; DESCRIPTION: Places a cyan line segment connecting (144, 116) to (20, 14).
; PLAN: r0=144(x1), r1=116(y1), r2=20(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 116
LDI r2, 20
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
