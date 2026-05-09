; DESCRIPTION: Places a cyan line segment connecting (108, 90) to (226, 30).
; PLAN: r0=108(x1), r1=90(y1), r2=226(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 90
LDI r2, 226
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
