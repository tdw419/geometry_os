; DESCRIPTION: Places a cyan line segment connecting (460, 55) to (255, 78).
; PLAN: r0=460(x1), r1=55(y1), r2=255(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 55
LDI r2, 255
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
