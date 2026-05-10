; DESCRIPTION: Draws a cyan line from (207, 88) to (86, 155).
; PLAN: r0=207(x1), r1=88(y1), r2=86(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 88
LDI r2, 86
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
