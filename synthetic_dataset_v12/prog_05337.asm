; DESCRIPTION: Draws a cyan line from (170, 191) to (318, 175).
; PLAN: r0=170(x1), r1=191(y1), r2=318(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 191
LDI r2, 318
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
