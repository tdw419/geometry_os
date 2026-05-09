; DESCRIPTION: Draws a black line from (220, 120) to (54, 62).
; PLAN: r0=220(x1), r1=120(y1), r2=54(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 120
LDI r2, 54
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
