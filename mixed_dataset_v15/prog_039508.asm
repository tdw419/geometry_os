; DESCRIPTION: Places a green line segment connecting (39, 149) to (27, 206).
; PLAN: r0=39(x1), r1=149(y1), r2=27(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 149
LDI r2, 27
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
