; DESCRIPTION: Places a cyan line segment connecting (345, 108) to (42, 145).
; PLAN: r0=345(x1), r1=108(y1), r2=42(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 108
LDI r2, 42
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
