; DESCRIPTION: Draws a black line from (246, 88) to (220, 146).
; PLAN: r0=246(x1), r1=88(y1), r2=220(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 88
LDI r2, 220
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
