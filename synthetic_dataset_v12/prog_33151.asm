; DESCRIPTION: Draws a green line from (1, 86) to (215, 85).
; PLAN: r0=1(x1), r1=86(y1), r2=215(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 86
LDI r2, 215
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
