; DESCRIPTION: Draws a green line from (89, 94) to (416, 228).
; PLAN: r0=89(x1), r1=94(y1), r2=416(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 94
LDI r2, 416
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
