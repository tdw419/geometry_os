; DESCRIPTION: Draws a yellow line from (446, 40) to (79, 176).
; PLAN: r0=446(x1), r1=40(y1), r2=79(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 40
LDI r2, 79
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
