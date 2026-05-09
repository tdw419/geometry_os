; DESCRIPTION: Draws a green line from (73, 52) to (128, 222).
; PLAN: r0=73(x1), r1=52(y1), r2=128(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 52
LDI r2, 128
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
