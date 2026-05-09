; DESCRIPTION: Draws a cyan line from (88, 96) to (25, 43).
; PLAN: r0=88(x1), r1=96(y1), r2=25(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 96
LDI r2, 25
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
