; DESCRIPTION: Draws a cyan line from (43, 31) to (199, 130).
; PLAN: r0=43(x1), r1=31(y1), r2=199(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 31
LDI r2, 199
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
