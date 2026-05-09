; DESCRIPTION: Places a cyan line segment connecting (182, 86) to (108, 10).
; PLAN: r0=182(x1), r1=86(y1), r2=108(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 86
LDI r2, 108
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
