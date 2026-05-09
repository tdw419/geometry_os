; DESCRIPTION: Places a cyan line segment connecting (127, 14) to (140, 199).
; PLAN: r0=127(x1), r1=14(y1), r2=140(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 14
LDI r2, 140
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
