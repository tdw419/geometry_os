; DESCRIPTION: Places a cyan line segment connecting (15, 168) to (219, 236).
; PLAN: r0=15(x1), r1=168(y1), r2=219(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 168
LDI r2, 219
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
