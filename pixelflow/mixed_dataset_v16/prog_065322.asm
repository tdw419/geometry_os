; DESCRIPTION: Draws a yellow line from (16, 244) to (401, 10).
; PLAN: r0=16(x1), r1=244(y1), r2=401(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 244
LDI r2, 401
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
