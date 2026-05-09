; DESCRIPTION: Draws a black line from (168, 48) to (129, 46).
; PLAN: r0=168(x1), r1=48(y1), r2=129(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 48
LDI r2, 129
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
