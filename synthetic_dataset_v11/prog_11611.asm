; DESCRIPTION: Draws a black line from (215, 72) to (108, 120).
; PLAN: r0=215(x1), r1=72(y1), r2=108(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 72
LDI r2, 108
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
