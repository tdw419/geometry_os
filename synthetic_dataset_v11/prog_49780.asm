; DESCRIPTION: Draws a black line from (86, 175) to (54, 243).
; PLAN: r0=86(x1), r1=175(y1), r2=54(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 175
LDI r2, 54
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
