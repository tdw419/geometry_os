; DESCRIPTION: Draws a cyan line from (486, 219) to (381, 76).
; PLAN: r0=486(x1), r1=219(y1), r2=381(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 219
LDI r2, 381
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
