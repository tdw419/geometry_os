; DESCRIPTION: Draws a green line from (237, 52) to (96, 0).
; PLAN: r0=237(x1), r1=52(y1), r2=96(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 52
LDI r2, 96
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
