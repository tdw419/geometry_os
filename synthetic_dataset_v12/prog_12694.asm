; DESCRIPTION: Draws a cyan line from (316, 137) to (191, 46).
; PLAN: r0=316(x1), r1=137(y1), r2=191(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 137
LDI r2, 191
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
