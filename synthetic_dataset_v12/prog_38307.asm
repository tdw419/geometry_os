; DESCRIPTION: Draws a yellow line from (346, 130) to (241, 106).
; PLAN: r0=346(x1), r1=130(y1), r2=241(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 130
LDI r2, 241
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
