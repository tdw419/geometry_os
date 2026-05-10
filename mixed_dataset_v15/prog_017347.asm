; DESCRIPTION: Draws a cyan line from (269, 13) to (199, 227).
; PLAN: r0=269(x1), r1=13(y1), r2=199(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 13
LDI r2, 199
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
