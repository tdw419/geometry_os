; DESCRIPTION: Draws a cyan line from (175, 198) to (175, 172).
; PLAN: r0=175(x1), r1=198(y1), r2=175(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 198
LDI r2, 175
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
