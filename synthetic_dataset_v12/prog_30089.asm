; DESCRIPTION: Draws a yellow line from (215, 53) to (247, 20).
; PLAN: r0=215(x1), r1=53(y1), r2=247(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 53
LDI r2, 247
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
