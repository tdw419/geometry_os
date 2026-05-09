; DESCRIPTION: Places a cyan line segment connecting (349, 166) to (32, 78).
; PLAN: r0=349(x1), r1=166(y1), r2=32(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 166
LDI r2, 32
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
