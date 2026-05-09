; DESCRIPTION: Draws a black line from (1, 168) to (122, 117).
; PLAN: r0=1(x1), r1=168(y1), r2=122(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 168
LDI r2, 122
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
