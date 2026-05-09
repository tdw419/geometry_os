; DESCRIPTION: Places a cyan line segment connecting (76, 209) to (110, 219).
; PLAN: r0=76(x1), r1=209(y1), r2=110(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 209
LDI r2, 110
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
