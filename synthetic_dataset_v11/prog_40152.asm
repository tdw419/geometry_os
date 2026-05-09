; DESCRIPTION: Places a cyan line segment connecting (125, 16) to (111, 80).
; PLAN: r0=125(x1), r1=16(y1), r2=111(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 16
LDI r2, 111
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
