; DESCRIPTION: Places a cyan line segment connecting (493, 142) to (240, 233).
; PLAN: r0=493(x1), r1=142(y1), r2=240(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 142
LDI r2, 240
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
