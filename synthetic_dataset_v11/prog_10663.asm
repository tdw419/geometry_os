; DESCRIPTION: Draws a cyan line from (0, 185) to (74, 88).
; PLAN: r0=0(x1), r1=185(y1), r2=74(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 185
LDI r2, 74
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
