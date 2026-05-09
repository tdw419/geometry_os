; DESCRIPTION: Draws a cyan line from (252, 219) to (287, 84).
; PLAN: r0=252(x1), r1=219(y1), r2=287(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 219
LDI r2, 287
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
