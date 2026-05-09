; DESCRIPTION: Places a cyan line segment connecting (398, 59) to (263, 77).
; PLAN: r0=398(x1), r1=59(y1), r2=263(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 59
LDI r2, 263
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
