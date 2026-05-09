; DESCRIPTION: Places a cyan line segment connecting (255, 81) to (463, 162).
; PLAN: r0=255(x1), r1=81(y1), r2=463(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 81
LDI r2, 463
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
