; DESCRIPTION: Draws a black line from (25, 67) to (243, 94).
; PLAN: r0=25(x1), r1=67(y1), r2=243(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 67
LDI r2, 243
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
