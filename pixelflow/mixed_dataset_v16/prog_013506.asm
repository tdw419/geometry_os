; DESCRIPTION: Places a cyan line segment connecting (32, 74) to (451, 29).
; PLAN: r0=32(x1), r1=74(y1), r2=451(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 74
LDI r2, 451
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
