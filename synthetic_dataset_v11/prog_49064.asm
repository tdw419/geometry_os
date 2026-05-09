; DESCRIPTION: Draws a yellow line from (168, 222) to (18, 49).
; PLAN: r0=168(x1), r1=222(y1), r2=18(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 222
LDI r2, 18
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
