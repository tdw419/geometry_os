; DESCRIPTION: Places a cyan line segment connecting (198, 135) to (151, 78).
; PLAN: r0=198(x1), r1=135(y1), r2=151(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 135
LDI r2, 151
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
