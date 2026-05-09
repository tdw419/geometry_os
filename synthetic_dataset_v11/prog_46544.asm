; DESCRIPTION: Places a cyan line segment connecting (140, 76) to (185, 146).
; PLAN: r0=140(x1), r1=76(y1), r2=185(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 76
LDI r2, 185
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
