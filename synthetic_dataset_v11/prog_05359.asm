; DESCRIPTION: Draws a blue line from (41, 149) to (168, 176).
; PLAN: r0=41(x1), r1=149(y1), r2=168(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 149
LDI r2, 168
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
