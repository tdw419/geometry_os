; DESCRIPTION: Places a cyan line segment connecting (363, 0) to (15, 59).
; PLAN: r0=363(x1), r1=0(y1), r2=15(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 0
LDI r2, 15
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
