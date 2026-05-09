; DESCRIPTION: Draws a cyan line from (6, 219) to (124, 130).
; PLAN: r0=6(x1), r1=219(y1), r2=124(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 219
LDI r2, 124
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
