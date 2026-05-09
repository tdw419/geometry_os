; DESCRIPTION: Draws a cyan line from (227, 192) to (69, 120).
; PLAN: r0=227(x1), r1=192(y1), r2=69(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 192
LDI r2, 69
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
