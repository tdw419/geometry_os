; DESCRIPTION: Draws a cyan line from (357, 192) to (299, 22).
; PLAN: r0=357(x1), r1=192(y1), r2=299(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 192
LDI r2, 299
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
