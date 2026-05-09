; DESCRIPTION: Places a cyan line segment connecting (353, 8) to (433, 79).
; PLAN: r0=353(x1), r1=8(y1), r2=433(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 8
LDI r2, 433
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
