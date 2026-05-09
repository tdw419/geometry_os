; DESCRIPTION: Draws a green line from (17, 32) to (121, 128).
; PLAN: r0=17(x1), r1=32(y1), r2=121(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 32
LDI r2, 121
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
