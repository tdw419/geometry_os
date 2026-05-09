; DESCRIPTION: Draws a green line from (175, 143) to (446, 251).
; PLAN: r0=175(x1), r1=143(y1), r2=446(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 143
LDI r2, 446
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
