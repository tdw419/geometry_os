; DESCRIPTION: Draws a cyan line from (204, 18) to (116, 172).
; PLAN: r0=204(x1), r1=18(y1), r2=116(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 18
LDI r2, 116
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
