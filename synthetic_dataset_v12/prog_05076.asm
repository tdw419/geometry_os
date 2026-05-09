; DESCRIPTION: Draws a yellow line from (437, 213) to (353, 203).
; PLAN: r0=437(x1), r1=213(y1), r2=353(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 213
LDI r2, 353
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
