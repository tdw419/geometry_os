; DESCRIPTION: Draws a red line from (160, 184) to (220, 120).
; PLAN: r0=160(x1), r1=184(y1), r2=220(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 184
LDI r2, 220
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
