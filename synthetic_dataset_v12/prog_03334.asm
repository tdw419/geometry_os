; DESCRIPTION: Draws a yellow line from (39, 103) to (224, 123).
; PLAN: r0=39(x1), r1=103(y1), r2=224(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 103
LDI r2, 224
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
