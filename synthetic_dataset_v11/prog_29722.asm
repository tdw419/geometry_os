; DESCRIPTION: Places a cyan line segment connecting (66, 52) to (112, 249).
; PLAN: r0=66(x1), r1=52(y1), r2=112(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 52
LDI r2, 112
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
