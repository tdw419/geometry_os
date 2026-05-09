; DESCRIPTION: Places a cyan line segment connecting (383, 40) to (493, 210).
; PLAN: r0=383(x1), r1=40(y1), r2=493(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 40
LDI r2, 493
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
