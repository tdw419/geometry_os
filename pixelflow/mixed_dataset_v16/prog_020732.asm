; DESCRIPTION: Places a cyan line segment connecting (428, 127) to (106, 28).
; PLAN: r0=428(x1), r1=127(y1), r2=106(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 127
LDI r2, 106
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
