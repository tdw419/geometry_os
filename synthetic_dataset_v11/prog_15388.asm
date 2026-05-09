; DESCRIPTION: Draws a cyan line from (124, 31) to (244, 136).
; PLAN: r0=124(x1), r1=31(y1), r2=244(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 31
LDI r2, 244
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
