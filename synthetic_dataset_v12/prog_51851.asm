; DESCRIPTION: Draws a cyan line from (181, 62) to (454, 18).
; PLAN: r0=181(x1), r1=62(y1), r2=454(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 62
LDI r2, 454
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
