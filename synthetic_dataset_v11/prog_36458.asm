; DESCRIPTION: Draws a cyan line from (68, 116) to (97, 123).
; PLAN: r0=68(x1), r1=116(y1), r2=97(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 116
LDI r2, 97
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
