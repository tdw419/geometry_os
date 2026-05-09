; DESCRIPTION: Places a cyan line segment connecting (127, 111) to (185, 157).
; PLAN: r0=127(x1), r1=111(y1), r2=185(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 111
LDI r2, 185
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
