; DESCRIPTION: Draws a black line from (183, 154) to (20, 168).
; PLAN: r0=183(x1), r1=154(y1), r2=20(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 154
LDI r2, 20
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
