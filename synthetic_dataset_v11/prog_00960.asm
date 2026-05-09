; DESCRIPTION: Draws a yellow line from (180, 41) to (146, 101).
; PLAN: r0=180(x1), r1=41(y1), r2=146(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 41
LDI r2, 146
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
