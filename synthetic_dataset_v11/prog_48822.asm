; DESCRIPTION: Places a cyan line segment connecting (79, 25) to (241, 219).
; PLAN: r0=79(x1), r1=25(y1), r2=241(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 25
LDI r2, 241
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
