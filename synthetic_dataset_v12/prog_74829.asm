; DESCRIPTION: Places a cyan line segment connecting (185, 39) to (96, 220).
; PLAN: r0=185(x1), r1=39(y1), r2=96(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 39
LDI r2, 96
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
