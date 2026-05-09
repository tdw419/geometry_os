; DESCRIPTION: Places a cyan line segment connecting (308, 240) to (195, 10).
; PLAN: r0=308(x1), r1=240(y1), r2=195(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 240
LDI r2, 195
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
