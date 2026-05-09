; DESCRIPTION: Draws a green line from (96, 213) to (118, 98).
; PLAN: r0=96(x1), r1=213(y1), r2=118(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 213
LDI r2, 118
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
