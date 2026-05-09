; DESCRIPTION: Draws a cyan line from (225, 119) to (196, 22).
; PLAN: r0=225(x1), r1=119(y1), r2=196(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 119
LDI r2, 196
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
