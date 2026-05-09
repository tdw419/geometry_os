; DESCRIPTION: Draws a cyan line from (205, 194) to (266, 45).
; PLAN: r0=205(x1), r1=194(y1), r2=266(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 194
LDI r2, 266
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
