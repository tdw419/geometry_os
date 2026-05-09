; DESCRIPTION: Places a cyan line segment connecting (178, 44) to (65, 101).
; PLAN: r0=178(x1), r1=44(y1), r2=65(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 44
LDI r2, 65
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
