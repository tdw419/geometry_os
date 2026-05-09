; DESCRIPTION: Draws a green line from (128, 96) to (62, 55).
; PLAN: r0=128(x1), r1=96(y1), r2=62(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 96
LDI r2, 62
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
