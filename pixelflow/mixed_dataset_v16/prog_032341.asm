; DESCRIPTION: Draws a black line from (397, 167) to (168, 123).
; PLAN: r0=397(x1), r1=167(y1), r2=168(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 167
LDI r2, 168
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
