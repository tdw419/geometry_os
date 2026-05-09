; DESCRIPTION: Places a cyan line segment connecting (249, 149) to (247, 3).
; PLAN: r0=249(x1), r1=149(y1), r2=247(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 149
LDI r2, 247
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
