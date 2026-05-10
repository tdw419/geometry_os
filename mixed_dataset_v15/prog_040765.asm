; DESCRIPTION: Places a cyan line segment connecting (249, 52) to (160, 24).
; PLAN: r0=249(x1), r1=52(y1), r2=160(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 52
LDI r2, 160
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
