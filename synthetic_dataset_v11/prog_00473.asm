; DESCRIPTION: Places a cyan line segment connecting (63, 87) to (112, 63).
; PLAN: r0=63(x1), r1=87(y1), r2=112(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 87
LDI r2, 112
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
