; DESCRIPTION: Places a cyan line segment connecting (210, 3) to (483, 215).
; PLAN: r0=210(x1), r1=3(y1), r2=483(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 3
LDI r2, 483
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
