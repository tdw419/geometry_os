; DESCRIPTION: Draws a cyan line from (204, 205) to (503, 130).
; PLAN: r0=204(x1), r1=205(y1), r2=503(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 205
LDI r2, 503
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
