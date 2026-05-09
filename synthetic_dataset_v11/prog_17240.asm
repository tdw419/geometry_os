; DESCRIPTION: Draws a yellow line from (108, 16) to (33, 64).
; PLAN: r0=108(x1), r1=16(y1), r2=33(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 16
LDI r2, 33
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
