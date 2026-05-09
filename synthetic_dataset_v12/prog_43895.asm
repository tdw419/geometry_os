; DESCRIPTION: Draws a green line from (86, 175) to (234, 72).
; PLAN: r0=86(x1), r1=175(y1), r2=234(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 175
LDI r2, 234
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
