; DESCRIPTION: Places a cyan line segment connecting (87, 240) to (237, 218).
; PLAN: r0=87(x1), r1=240(y1), r2=237(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 240
LDI r2, 237
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
