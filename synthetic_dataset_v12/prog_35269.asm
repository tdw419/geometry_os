; DESCRIPTION: Places a cyan line segment connecting (274, 64) to (185, 70).
; PLAN: r0=274(x1), r1=64(y1), r2=185(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 64
LDI r2, 185
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
