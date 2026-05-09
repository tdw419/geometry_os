; DESCRIPTION: Draws a cyan line from (175, 119) to (124, 165).
; PLAN: r0=175(x1), r1=119(y1), r2=124(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 119
LDI r2, 124
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
