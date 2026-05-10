; DESCRIPTION: Draws a yellow line from (256, 55) to (304, 14).
; PLAN: r0=256(x1), r1=55(y1), r2=304(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 55
LDI r2, 304
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
