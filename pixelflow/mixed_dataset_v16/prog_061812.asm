; DESCRIPTION: Places a cyan line segment connecting (471, 55) to (38, 59).
; PLAN: r0=471(x1), r1=55(y1), r2=38(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 55
LDI r2, 38
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
